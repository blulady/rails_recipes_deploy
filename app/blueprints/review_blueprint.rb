# frozen_string_literal: true

class ReviewBlueprint < Blueprinter::Base
    identifier :id
    fields :comment, :rating
    view :normal do
        fields :comment, :rating, :date
    end
end
