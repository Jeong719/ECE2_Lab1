# PDF의 보드 핀 표를 보고 PACKAGE_PIN과 IOSTANDARD를 직접 작성하세요.
# get_ports 대상은 자신이 작성한 RTL 포트명과 일치해야 합니다.
# 논리 시뮬레이션은 XDC의 실제 핀 배정을 검증하지 않습니다.
set_property PACKAGE_PIN K4 [get_ports a]
set_property PACKAGE_PIN N8 [get_ports b]
set_property PACKAGE_PIN L4 [get_ports out_and]
set_property Package_PIN M4 [get_ports out_or]
set_property PACKAGE_PIN M2 [get_ports out_xor]
set_property IOSTANDARD LVCMOS33 [get_ports a]
set_property IOSTANDARD LVCMOS33 [get_ports b]
set_property IOSTANDARD LVCMOS33 [get_ports out_and]
set_property IOSTANDARD LVCMOS33 [get_ports out_or]
set_property IOSTANDARD LVCMOS33 [get_ports out_xor]