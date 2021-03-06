class Customer::CreateCustomerIdJob < ApplicationJob
  queue_as :default

  def perform(stripeable)
    stripeable = Stripe::Customer.create(
      { description: stripeable.name },
      api_key: stripeable.stripe_api_key
    )
    stripeable.update(stripe_customer_id: customer.id)
  end
end
