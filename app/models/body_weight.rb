# frozen_string_literal: true

class BodyWeight < ApplicationRecord
  belongs_to :rabbit

  def self.library_options
    {
      spanGaps: true,
      scales: {
        xAxes: [{
          position: 'bottom',
          gridLines: { drawOnChartArea: true },
          type: 'time',
          time: { unit: 'week',
                  displayFormats: { week: 'M月D日' } }
        }],
        yAxes: [{
          scaleLabel: {
            labelString: '体重'
          },
          ticks: { min: 300 }
        }]
      }
    }
  end
end
