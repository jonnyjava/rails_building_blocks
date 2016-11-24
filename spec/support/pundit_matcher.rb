RSpec::Matchers.define :allow_action do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message do |policy|
    build_failure_message(policy, 'permit', action)
  end

  failure_message_when_negated do |policy|
    build_failure_message(policy, 'forbid', action)
  end

  private

  def build_failure_message(policy, behaviour, action)
    "#{policy.class} does not #{behaviour} #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end
