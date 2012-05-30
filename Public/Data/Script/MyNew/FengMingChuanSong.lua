x390003_g_ScriptId	= 390003

x390003_g_needLevel = 0
x390003_g_needMoney = 1
x390003_g_Scene= 0
x390003_g_X= 0
x390003_g_Z= 0

function x390003_Update( sceneId, selfId, targetId )	
	local posX, posZ = GetWorldPos(sceneId, targetId);
	if posX==30 and posZ==79 then--Į��
		x390003_g_needLevel=160
		x390003_g_needMoney=20000000
		x390003_g_Scene=573
		x390003_g_X=148
		x390003_g_Z=217
	elseif posX==113 and posZ==429 then--����
		x390003_g_needLevel=180
		x390003_g_needMoney=30000000
		x390003_g_Scene=574
		x390003_g_X=36
		x390003_g_Z=40
	elseif posX==433 and posZ==141 then--����ϻ�
		x390003_g_needLevel=200
		x390003_g_needMoney=50000000
		x390003_g_Scene=575
		x390003_g_X=36
		x390003_g_Z=219
	end
end
--**********************************
--�¼��������
--**********************************
function x390003_OnDefaultEvent( sceneId, selfId, targetId )	
	x390003_Update( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    �װ�����ң�ͨ���¸���ͼ����Ҫ���Ŷ��")
		AddNumText(sceneId, x390003_g_ScriptId,"#cfff263����Ҫ#G"..x390003_g_needLevel.."#cfff263����", 9, 1)
		AddNumText(sceneId, x390003_g_ScriptId,"#cfff263����Ҫ#{_MONEY"..x390003_g_needMoney.."}��", 9, 2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x390003_OnEventRequest( sceneId, selfId, targetId, eventId )--574,����
	x390003_Update( sceneId, selfId, targetId )
	if GetNumText() == 1  then
		x390003_LevelGoto( sceneId, selfId, x390003_g_needLevel,x390003_g_Scene,x390003_g_X,x390003_g_Z)
	elseif GetNumText() == 2  then		
		x390003_MoneyGoto( sceneId, selfId, x390003_g_needMoney,x390003_g_Scene,x390003_g_X,x390003_g_Z)
	end

end

function x390003_LevelGoto( sceneId, selfId, needLevel,nSid,nX,nZ)
	local	lev	= GetLevel( sceneId, selfId )
	if lev>=needLevel then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, nSid, nX, nZ )
	else
		x390003_MsgBox( sceneId, selfId, targetId, "    #Y���ĵȼ������ء�" )
	end
end

function x390003_MoneyGoto( sceneId, selfId, needMoney,nSid,nX,nZ)
	local reply = CostMoney(sceneId,selfId,needMoney)
	if reply == -1 then
		x390003_MsgBox( sceneId, selfId, targetId, "    #Y���ͱ�������ˣ�Ǯ�����ء�" )
	else
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, nSid, nX, nZ )
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x390003_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x390003_Tips( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
