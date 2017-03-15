# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  sign = (numerator * denominator) >= 0 ? "":"-"
  numerator, denominator = numerator.abs, denominator.abs

  quotient, rem = numerator.divmod(denominator)
  return sprintf("%s%s",sign,quotient) if rem == 0
  quotient_part = sprintf("%s%s.",sign,quotient)

  tables = {}
  decimal_part = ""
  
  while rem.nonzero? 
    quo, rem = (rem * 10).divmod(denominator)
    decimal_part += quo.to_s
    return quotient_part + decimal_part.insert(tables[rem],"(") + ")" if tables[rem] != nil
    tables[rem] = decimal_part.size
    print tables
  end 

  return quotient_part + decimal_part
end

