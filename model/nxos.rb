class NXOS < Oxidized::Model
  using Refinements

  prompt /^(\r?[\w.@_()-]+[#]\s?)$/
  comment '! '

  def filter(cfg)
    cfg.gsub! /\r\n?/, "\n"
    cfg.gsub! prompt, ''
  end

  cmd 'show version' do |cfg|
    cfg = filter cfg
    cfg = cfg.each_line.take_while { |line| not line.match(/uptime/i) }
    comment cfg.join
  end

  cmd 'show running-config' do |cfg|
    cfg = filter cfg
    cfg.gsub! /^(show run.*)$/, '! \1'
    cfg.gsub! /^!Time:[^\n]*\n/, ''
    cfg.gsub! /^[\w.@_()-]+[#].*$/, ''
    cfg
  end

  cmd 'show environment' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end
  
  cmd 'show interface brief' do |cfg|
   cfg = cfg.each_line.to_a[1..-1].join
   cfg
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
