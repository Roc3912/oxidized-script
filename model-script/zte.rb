class ZTE < Oxidized::Model
  using Refinements
  
  #

  prompt /^([\w.@()-]+[#>]\s?)$/
  comment  '! '

  cmd :all do |cfg|
  #  cfg.each_line.to_a[1..-1].join
    cfg
  end
  
  cmd 'show version' do |cfg|
    comment cfg
  end

  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show ip int brief' do |cfg|
    comment cfg
  end

  cmd 'show int brief' do |cfg|
    comment cfg
  end
  
  cmd 'show fan-status' do |cfg|
    comment cfg
  end
  
  cmd 'show power-status' do |cfg|
    comment cfg
  end
  
  cmd 'show power-status' do |cfg|
    comment cfg
  end
  
  cmd 'show logging' do |cfg|
    comment cfg
  end

  cfg :telnet do
    username /^Username:/i
    password /^Password:/i
  end

  cfg :telnet, :ssh do
    # preferred way to handle additional passwords
    post_login do
      if vars(:enable) == true
        cmd "enable"
      elsif vars(:enable)
        cmd "enable", /^[pP]assword:/
        cmd vars(:enable)
      end
    end
    post_login 'terminal length 0'
    post_login 'terminal width 0'
    pre_logout 'exit'
  end
end
