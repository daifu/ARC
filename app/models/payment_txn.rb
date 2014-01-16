class PaymentTxn < ActiveRecord::Base
  self.abstract_class = true
  
  serialize :response_params, Hash
  enumerable_constant :txn_type, :constants => [:authorize, :capture, :purchase, :void, :credit, :failure, :reauthorize]
end