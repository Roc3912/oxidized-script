class IOSXR < Oxidized::Model
  using Refinements

  # IOS XR model #

  prompt /^(\r?[\w.@:\/-]+[#>]\s?)$/
  comment  '! '

  cmd :all do |cfg|
    cfg.each_line.to_a[2..-2].join
  end

  cmd :secret do |cfg|
    cfg.gsub! /^(snmp-server community).*/, '\\1 <configuration removed>'
    cfg.gsub! /secret (\d+) (\S+).*/, '<secret hidden>'
    cfg
  end

  cmd 'show platform' do |cfg|
    comment cfg
  end

  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'admin show environment' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show bgp vpnv4 unicast summary nsr' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show bgp ipv4 unicast summary nsr' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show bgp vpnv4 unicast labels' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show bgp vrf all' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show mpls interfaces' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show mpls ldp neighbor' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show isis neighbors' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show isis route detail' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show isis statistics' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show route afi-all summary' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show route' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show route vrf all' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show ipsubscriber access-interface brief' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show pppoe summary per-access-interface' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show subscriber session  all username' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show dhcp ipv4 proxy binding' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show subscriber session all summary' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end
 
  cfg :telnet do
    username /^Username:/
    password /^\r?Password:/
  end

  cfg :telnet, :ssh do
    post_login 'terminal length 0'
    post_login 'terminal width 0'
    post_login 'terminal exec prompt no-timestamp'
    if vars :enable
      post_login do
        send "enable\n"
        send vars(:enable) + "\n"
      end
    end
    pre_logout 'exit'
  end
end
