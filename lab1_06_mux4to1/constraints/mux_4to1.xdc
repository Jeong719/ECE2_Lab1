# PDF의 보드 핀 표를 보고 PACKAGE_PIN과 IOSTANDARD를 직접 작성하세요.
# get_ports 대상은 자신이 작성한 RTL 포트명과 일치해야 합니다.
# 논리 시뮬레이션은 XDC의 실제 핀 배정을 검증하지 않습니다.
set_property PACKAGE_PIN L4 [get_ports y]
set_property PACKAGE_PIN K4 [get_ports {d[3]}]
set_property PACKAGE_PIN N8 [get_ports {d[2]}]
set_property PACKAGE_PIN N4 [get_ports {d[1]}]
set_property PACKAGE_PIN N1 [get_ports {d[0]}]
set_property PACKAGE_PIN Y1 [get_ports {sel[1]}]
set_property PACKAGE_PIN W3 [get_ports {sel[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports y]
set_property IOSTANDARD LVCMOS33 [get_ports {d[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel[0]}]