class Racist::Bouncer
  def initialize(opts)
    @opts = opts
  end
  def segregate(params)
    @opts.reduce({}) do |output, key_and_value|
      output[key_and_value.first] = key_and_value.last if _allowable? expected_type: key_and_value.last, actual_value: params[key_and_value.first]
      output
    end
  end
  private
  def _allowable?(expected_type: string, actual_value: value)
    Racist::JimCrowLaw.parse(string).white? value
  end
end