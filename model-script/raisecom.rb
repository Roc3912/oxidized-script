class RAISECOM < Oxidized::Model
  using Refinements

  comment '!' ##在每行添加 ！注释，如果想去除可以' '
  prompt /([>\-#]\s?)$/

  cmd 'show version' do |cfg|
    comment cfg
  end

  cmd 'show running-config' do |cfg|
    comment cfg
  end

  cfg :telnet do
    username /Login:/       # 根据实际提示符修改
    password /Password:/       # 根据实际提示符修改
    post_login 'terminal page-break disable'   # 根据交换机分页命令修改
    pre_logout 'exit'
  end
end

