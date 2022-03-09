class GrammarStats

  def initialize
    @total_checks = 0
    @true_checks = 0
  end


  def check(text)
    @total_checks += 1
    if text[0] == text[0].upcase && (['.', '!', '?'].include? text[-1])
      @true_checks += 1
      return true
    else
      return false
    end
  end

  def percentage_good
    @percentage_as_f = (@true_checks.to_f / @total_checks.to_f ) * 100
    return @percentage_as_f.to_i
  end

end