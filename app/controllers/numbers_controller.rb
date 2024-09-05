class NumbersController < ApplicationController
  def process_numbers
    begin
      numbers = JSON.parse(request.body.read)

      if numbers.is_a?(Array) && numbers.all? { |n| n.is_a?(Integer) }
        result = numbers.sum
        render plain: result.to_s
      else
        render json: { error: 'Invalid input, expected an array of integers.' }, status: :unprocessable_entity
      end
    rescue JSON::ParserError
      render json: { error: 'Invalid JSON format.' }, status: :unprocessable_entity
    end
  end
end