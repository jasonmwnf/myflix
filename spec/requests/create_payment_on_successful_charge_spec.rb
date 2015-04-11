require 'spec_helper'

describe "Create payment on successful charge" do 
  let(:event_data) do
    {
      "id" => "evt_15pihPDOCi1ehaTMV8xyr5a2",
      "created" => 1428597615,
      "livemode" => false,
      "type" => "charge.succeeded",
      "data" => {
        "object" => {
          "id" => "ch_15pihPDOCi1ehaTMnmSOmaLQ",
          "object" => "charge",
          "created" => 1428597615,
          "livemode" => false,
          "paid" => true,
          "status" => "succeeded",
          "amount" => 999,
          "currency" => "cad",
          "refunded" => false,
          "source" => {
            "id" => "card_15pihODOCi1ehaTMFbdzyK9O",
            "object" => "card",
            "last4" => "4242",
            "brand" => "Visa",
            "funding" => "credit",
            "exp_month" => 4,
            "exp_year" => 2015,
            "fingerprint" => "H26dOohpCTeoD8lr",
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
            "customer" => "cus_61mFeUN14moDwK"
          },
          "captured" => true,
          "balance_transaction" => "txn_15pihPDOCi1ehaTMKhNs9wjN",
          "failure_message" => nil,
          "failure_code" => nil,
          "amount_refunded" => 0,
          "customer" => "cus_61mFeUN14moDwK",
          "invoice" => "in_15pihPDOCi1ehaTMT2TV6hLK",
          "description" => nil,
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
            "url" => "/v1/charges/ch_15pihPDOCi1ehaTMnmSOmaLQ/refunds",
            "data" => []
          }
        }
      },
      "object" => "event",
      "pending_webhooks" => 1,
      "request" => "iar_61mFjQfmye2eSm",
      "api_version" => "2015-03-24"
    }
  end

  it "creates a payment with the webhook from stripe for charge succeeded", :vcr do 
    post "/stripe_events", event_data
    expect(Payment.count).to eq(1)
  end

  it "creates the payment associated with user", :vcr do
    alice = Fabricate(:user, customer_token: "cus_61mFeUN14moDwK")
    post "/stripe_events", event_data
    expect(Payment.first.user).to eq(alice)
  end

  it "creates the payment with the amount", :vcr do 
    alice = Fabricate(:user, customer_token: "cus_61mFeUN14moDwK")
    post "/stripe_events", event_data
    expect(Payment.first.amount).to eq(999)
  end

  it "creates the payment with reference id", :vcr do 
    alice = Fabricate(:user, customer_token: "cus_61mFeUN14moDwK")
    post "/stripe_events", event_data
    expect(Payment.first.reference_id).to eq("ch_15pihPDOCi1ehaTMnmSOmaLQ")
  end
end