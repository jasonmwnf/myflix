require 'spec_helper'

describe 'Deactivate user on failed charge' do 
  let(:event_data) do 
    {
      "id" => "evt_15qokEDOCi1ehaTM560TczFJ",
      "created" => 1428859182,
      "livemode" => false,
      "type" => "charge.failed",
      "data" => {
        "object" => {
          "id" => "ch_15qokEDOCi1ehaTM6PPedw4N",
          "object" => "charge",
          "created" => 1428859182,
          "livemode" => false,
          "paid" => false,
          "status" => "failed",
          "amount" => 999,
          "currency" => "cad",
          "refunded" => false,
          "source" => {
            "id" => "card_15qoibDOCi1ehaTMP9NNFJQJ",
            "object" => "card",
            "last4" => "0341",
            "brand" => "Visa",
            "funding" => "credit",
            "exp_month" => 4,
            "exp_year" => 2016,
            "fingerprint" => "pktJYgXcivqQUx63",
            "country" => "US",
            "name" => nil,
            "address_line1" => nil,
            "address_line2" => nil,
            "address_city" => nil,
            "address_state" => nil,
            "address_zip" => nil,
            "address_country" => nil,
            "cvc_check" => "pass",
            "address_line1_check" => nil,
            "address_zip_check" => nil,
            "dynamic_last4" => nil,
            "metadata" => {},
            "customer" => "cus_62tsr7sURn0mTy"
          },
          "captured" => false,
          "balance_transaction" => nil,
          "failure_message" => "Your card was declined.",
          "failure_code" => "card_declined",
          "amount_refunded" => 0,
          "customer" => "cus_62tsr7sURn0mTy",
          "invoice" => nil,
          "description" => "payment to fail",
          "dispute" => nil,
          "metadata" => {},
          "statement_descriptor" => nil,
          "fraud_details" => {},
          "receipt_email" => nil,
          "receipt_number" => nil,
          "shipping" => nil,
          "application_fee" => nil,
          "refunds" => {
            "object" => "list",
            "total_count" => 0,
            "has_more" => false,
            "url" => "/v1/charges/ch_15qokEDOCi1ehaTM6PPedw4N/refunds",
            "data" => []
          }
        }
      },
      "object" => "event",
      "pending_webhooks" => 1,
      "request" => "iar_62uZuZhrka5VWy",
      "api_version" => "2015-03-24"
    }
  end

  it "deactivates a user with the web hook data from stripe for charge failed", :vcr do
    alice = Fabricate(:user, customer_token: "cus_62tsr7sURn0mTy")
    post "/stripe_events", event_data
    expect(alice.reload).not_to be_active
  end
end