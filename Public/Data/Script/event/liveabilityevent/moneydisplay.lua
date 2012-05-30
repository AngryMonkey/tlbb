--#-02钱显示转换

--脚本号
--g_ScriptId = 701604

--**********************************
--任务入口函数
--**********************************
function x701604_MoneyDisplayChange( sceneId, selfId, money )
	Moneydisplay = ""
	Bronze = mod(money,100)
	Silver = (mod(money,10000) - Bronze)/100
	Gold = (money - Bronze - Silver * 100)/10000
	if Gold ~= 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"
	elseif Gold ~= 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"
	elseif Gold == 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Silver.."#-03"..Bronze.."#-04"
	elseif Gold == 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Silver.."#-03"
	elseif Gold == 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Bronze.."#-04"
	elseif Gold  == 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = "0#-04"
	end
	return Moneydisplay
end
