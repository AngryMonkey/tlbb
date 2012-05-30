--����boss���䱦��������
--�޵�buff
x050052_g_impactID = 54
x050052_strErrorNotice = "#{NSBS_20071228_10}"

x050052_g_strNotice0 = "#{NSBS_20071228_16}"
x050052_g_strNotice1 = "#{NSBS_20071228_17}"
--�ʱ��
x050052_g_StartDayTime = 8030   --�����ʱ�� 2008-1-31
x050052_g_EndDayTime = 8044   --�����ʱ�� 2008-2-14

function x050052_OnRecycle(sceneId,selfId,targetId)
	
	--1.֪ͨ����boss�ű��������䱦��
	CallScriptFunction( 050051, "DropNianShouBox", sceneId)
	

	return 1;
end

function x050052_OnCreate(sceneId,growPointType,x,y)

end

function x050052_OnOpen(sceneId,selfId,targetId)
	local level = GetLevel( sceneId, selfId )
	
	if level < 10 then
			BeginEvent(sceneId)
			AddText(sceneId, x050052_strErrorNotice);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return OR_NEED_HIGH_LEVEL;
	end
	

	return OR_OK;
end

function x050052_OnProcOver(sceneId,selfId,targetId)
		--2.�������߼���Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x050052_g_impactID, 0)
end

--**********************************
--����Ƿ��ѽ���
--**********************************
function x050052_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050052_g_StartDayTime and curDayTime <= x050052_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
-- �����ը������ʰȡ��������Ʒʱ�ص����ӿ�
--**********************************
function x050052_OnPlayerPickUpItemInNianShou( sceneId, selfId, itemId, bagidx )

	local isTime = x050052_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	--����....
	if itemId == 30505107 or itemId == 30501159 or itemId ==30501160 or itemId == 10141105 or itemId == 10141106 or itemId == 10141107 or itemId == 10141108 or itemId == 10141109  or itemId == 10141110 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
		local str = format( "#{_INFOUSR%s}", playerName)
		local str1 = format( "#{_INFOMSG%s}", transfer)
		
		local message = str..x050052_g_strNotice0..str1..x050052_g_strNotice1
		--format("#{_INFOUSR%s}#P�������ӳ�һ�����ڣ�����žžһ��ը֮����������һ��#{_INFOMSG%s}#P����Ķ��ӣ�", playerName, transfer )
		BroadMsgByChatPipe(sceneId, selfId, message, 4)

	end

end
