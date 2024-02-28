# frozen_string_literal: true

class IngredientBlueprint < Blueprinter::Base
    identifier :id
    fields :name
    view :normal do
        fields :name
    end
end
