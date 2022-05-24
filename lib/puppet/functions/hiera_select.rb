# @summary
#   Selects a key matching a given parameter
# 
# @example Find the house number of alice and bob: 
#   
#   hiera_select(lookup('house::abbey_road'), ['Alice','Bob'])
#   will return 7 given the following data from hiera:
#   house:abbey_road:
#     - 7: ['Alice','Bob']
#     - 12: ['John','Yoko']
#


Puppet::Functions.create_function(:'hiera_select') do
  dispatch :up do
    param 'Hash', :hiera
    param 'Any', :se_lect # do not conflict with Ruby select function
  end

  def hiera_select(hiera, se_lect)
    hiera.each do |key, value|
      if value == se_lect
        return key
      end
    end
  end
end
