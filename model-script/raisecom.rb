class RAISECOM < Oxidized::Model
  using Refinements

  comment '! '
  prompt /([>\-#]\s?)$/

  cmd 'show version' do |cfg|
    cfg.gsub! /\s(System uptime is ).*/, ' \\1 <removed>'
    comment cfg
  end

  cmd 'show running-config' do |cfg|
    cfg.gsub! /\s(^radius-encrypt-key ).*/, ' \\1 <removed>'
    cfg
  end

  cfg :telnet do
    username /Login:/       # 根据实际提示符修改
    password /Password:/       # 根据实际提示符修改
    post_login 'terminal page-break disable'   # 根据交换机分页命令修改
    pre_logout 'exit'
  end
end

