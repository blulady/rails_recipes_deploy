# frozen_string_literal: true

class MeasurementBlueprint < Blueprinter::Base
    identifier :id
    view :normal do
        fields :unit_measurement
    end
end
