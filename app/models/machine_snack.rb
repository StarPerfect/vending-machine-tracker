class MachineSnack < ApplicationRecord
  validates_presence_of :snack_id, :machine_id

  belongs_to :snack
  belongs_to :machine
end
