class IOSXR < Oxidized::Model
  using Refinements

  # IOS XR model #

  prompt /^(\r?[\w.@:\/-]+[#>]\s?)$/
  comment  '! '

  cmd :all do |cfg|
  #  cfg.each_line.to_a[1..-1].join
    cfg
  end

  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end
  
  cmd 'admin show environment' do |cfg|
    comment cfg
  end

  cmd 'show processes cpu' do |cfg|
    comment cfg
  end
  
  cmd 'show interfaces brief | exclude .pppoe | exclude .ip' do |cfg|
    comment cfg
  end
  
  cmd 'show ipv4 interface brief | exclude .pppoe | exclude .ip' do |cfg|
    comment cfg
  end
  
  cmd 'show ipv6 interface brief enable' do |cfg|
    comment cfg
  end

  cmd 'show isis neighbors' do |cfg|
    comment cfg
  end
  
  cmd 'show isis adjacency detail' do |cfg|
    comment cfg
  end
  
  cmd 'show route afi-all' do |cfg|
    comment cfg
  end
  
  cmd 'show route vrf all' do |cfg|
    comment cfg
  end
   
  cmd 'show bgp ipv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'show bgp vpnv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'show bgp ipv6 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'show bgp vpnv4 unicast summary' do |cfg|
    comment cfg
  end
  
  cmd 'show msdp vrf YNGD-Mroute summary' do |cfg|
    comment cfg
  end
  
  cmd 'show l2vpn xconnect state up' do |cfg|
    comment cfg
  end
  
  cmd 'sh l2vpn xconnect state down' do |cfg|
    comment cfg
  end
  
  cmd 'show l2vpn bridge-domain brief' do |cfg|
    comment cfg
  end
  
  cmd 'show logging last 200' do |cfg|
    comment cfg
  end
  
  cmd 'show msdp vrf YNGD-Mroute summary' do |cfg|
    comment cfg
  end
  
  cmd 'show pppoe summary per-access-interface' do |cfg|
    comment cfg
  end
  
  cmd 'show ipsubscriber access-interface brief' do |cfg|
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
    pre_logout 'exit'
  end
end
