# frozen_string_literal: true

class Api::RabbitsController < Api::ApplicationController
  protect_from_forgery except: [:slack]

  def slack
    rabbit = Rabbit.find_by(token: params[:token])
    return unless rabbit.present?

    body = JSON.parse(request.body.read)
    case body['type']
    when 'url_verification'
      render json: body
    when 'event_callback'
      unless from_bot?(body)
        num = body['event']['text'].match(/\d+/).present? ? body['event']['text'].match(/\d+/)[0] : nil
        feeding = rabbit.feeding(date: Time.current)
        if feeding.body_weight.present?
          feeding.body_weight.update(gram: num)
        else
          feeding.builds
          feeding.body_weight.assign_attributes(gram: num, scaled_at: Time.current)
          feeding.body_weight.save
        end
        if rabbit.slack_webhook_url
          notifier = Slack::Notifier.new(rabbit.slack_webhook_url)
          message = "ぼくの体重は#{feeding.body_weight.gram}g。ペレットは1日#{rabbit.ideal_pellet_gram&.round(1)}gでおねがいね！[くわしくはこちら](#{root_url}) 。"
          notifier.ping(message)
        end
      end
      head :ok
    end
  end

  private

  def from_bot?(body)
    body['event']['subtype'] == 'bot_message'
  end
end
