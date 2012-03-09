module FormHelper
  def setup_contract(contract)
    contract.codelines ||= Codeline.new
    3.times { @contract.codelines.build }
    contract
  end
 end
