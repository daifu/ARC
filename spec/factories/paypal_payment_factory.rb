FactoryGirl.define do

  factory :authorized_paypal_payment, :class => PaypalPayment do |factory|
    factory.paypal_txns { [FactoryGirl.create(:paypal_txn, :txn_type => PaymentTxn::TxnType::AUTHORIZE)] }
    factory.association :order
  end

  factory :captured_paypal_payment, :class => PaypalPayment do |factory|
    factory.association :creditcard
    factory.paypal_txns { [FactoryGirl.create(:paypal_txn, :txn_type => PaymentTxn::TxnType::CAPTURE)] }
    factory.association :order
  end

  factory :paypal_txn do |factory|
    factory.amount 45.75
    factory.txn_type PaymentTxn::TxnType::AUTHORIZE
    factory.payment_status :success
  end
  
end
