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

  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'admin show environment' do |cfg|
    comment cfg
  end

  cmd 'sh processes cpu' do |cfg|
    comment cfg
  end
  
  cmd 'sh interfaces brief' do |cfg|
    comment cfg
  end
  
  cmd 'sh ipv4 interface brief' do |cfg|
    comment cfg
  end
  
  cmd 'sh ipv6 interface brief' do |cfg|
    comment cfg
  end

  cmd 'sh isis neighbors' do |cfg|
    comment cfg
  end
  
  cmd 'sh isis adjacency detail' do |cfg|
    comment cfg
  end
  
  cmd 'sh route afi-all' do |cfg|
    comment cfg
  end
  
  cmd 'sh route vrf all' do |cfg|
    comment cfg
  end
   
  cmd 'sh bgp ipv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'sh bgp vpnv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'sh bgp ipv6 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'sh bgp vpnv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'sh l2vpn xconnect state up' do |cfg|
    comment cfg
  end
  
  cmd 'sh l2vpn xconnect state down' do |cfg|
    comment cfg
  end
  
  cmd 'sh l2vpn bridge-domain brief' do |cfg|
    comment cfg
  end
  
  cmd 'sh pppoe summary per-access-interface' do |cfg|
    comment cfg
  end
  
  cmd 'sh ipsubscriber access-interface brief' do |cfg|
    comment cfg
  end
  
  cmd 'sh dhcp ipv4 proxy binding' do |cfg|
    comment cfg
  end
  
  cmd 'sh logging' do |cfg|
    comment cfg
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
