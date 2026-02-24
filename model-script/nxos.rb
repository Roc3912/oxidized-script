class NXOS < Oxidized::Model
  using Refinements

  prompt /^(\r?[\w.@_()-]+\#\s?)$/
  comment '! '

  cmd :all do |cfg|
  #  cfg.cut_both
    cfg
  end

  cmd 'show version' do |cfg|
    comment cfg
  end
  
  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end
  
  cmd 'show environment' do |cfg|
    comment cfg
  end

  cmd 'show processes cpu' do |cfg|
    comment cfg
  end
  
  cmd 'show interfaces status' do |cfg|
    comment cfg
  end
  
  cmd 'show ip interface  brief' do |cfg|
    comment cfg
  end
 
  cmd 'show logging last 200' do |cfg|
    comment cfg
  end

  cfg :ssh, :telnet do
    post_login 'terminal length 0'
    pre_logout 'exit'
  end

  cfg :telnet do
    username /^login:/
    password /^Password:/
  end
end
