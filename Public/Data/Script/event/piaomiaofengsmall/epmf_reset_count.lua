--������翷帱����ս����....

--������ע�⣡����
--���ô�����������ʹ��һ��INT�������....
--INT�ĵ�2λ��ʾ����....���ÿ�����ֻ֧������99��....
--��������ÿ�����ĵ���Ʒ�������ϴε�2��....���Ե�99����Ҫ����������������....2^99


--�ű���
x402289_g_ScriptId = 402289


--**********************************
--������ں���....
--**********************************
function x402289_OnDefaultEvent( sceneId, selfId, targetId )

	local NumText = GetNumText()

	if NumText == 1	then

		x402289_CheckCanReset( sceneId, selfId, targetId )

	elseif NumText == 2	then

		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_6}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 3	then

		x402289_ResetPMFCount( sceneId, selfId, targetId )

	elseif NumText == 4	then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	end

end

--**********************************
--�о��¼�
--**********************************
function x402289_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x402289_g_ScriptId, "#{INTERFACE_XML_1183}", 9, 1 )
	AddNumText( sceneId, x402289_g_ScriptId, "#{INTERFACE_XML_1184}", 11, 2 )

end

--**********************************
--�ж��Ƿ������ս��翷�....
--**********************************
function x402289_CheckCanReset( sceneId, selfId, targetId )

	--��ȡ������սС��翵Ĵ���....
	local CurDayTime = GetDayTime()
	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	--�����û��ս��С��翷�....����Ҫ���ô���....
	if lastDayCount <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_1}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--��ȡ ����������ս���� �Ĵ���....
	local lastTime2 = GetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME )
	local lastDayTime2 = floor( lastTime2 / 100 )
	local lastDayCount2 = mod( lastTime2, 100 )
	if CurDayTime > lastDayTime2 then
		lastDayTime2 = CurDayTime
		lastDayCount2 = 0
	end

	--����ȷ�ϲ˵�....
	local NeedNum = 2^lastDayCount2
	local NeedNum2 = 2^(lastDayCount2+1)
	BeginEvent(sceneId)
		AddText( sceneId, "#{CZPMF_90212_1}"..NeedNum.."#{CZPMF_90212_2}"..NeedNum2.."#{CZPMF_90212_3}" )
		AddNumText( sceneId, x402289_g_ScriptId, "ȷ��", 8, 3 )
		AddNumText( sceneId, x402289_g_ScriptId, "ȡ��", 8, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--����С��翷���ս����....
--**********************************
function x402289_ResetPMFCount( sceneId, selfId, targetId )

	--��ȡ������սС��翵Ĵ���....
	local CurDayTime = GetDayTime()
	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	--�����û��ս��С��翷�....����Ҫ���ô���....
	if lastDayCount <= 0 then
		return
	end

	--��ȡ ����������ս���� �Ĵ���....
	local lastTime2 = GetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME )
	local lastDayTime2 = floor( lastTime2 / 100 )
	local lastDayCount2 = mod( lastTime2, 100 )
	if CurDayTime > lastDayTime2 then
		lastDayTime2 = CurDayTime
		lastDayCount2 = 0
	end

	--�Ƿ����㹻����Ʒ....
	local NeedNum = 2^lastDayCount2
	if LuaFnGetAvailableItemCount( sceneId, selfId, 30501170 ) < NeedNum then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_4}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--����Ʒ....
	if 1 ~= LuaFnDelAvailableItem(sceneId, selfId, 30501170, NeedNum ) then
		return
	end

	--����С��翷���ս����....
	lastTime = lastDayTime * 100 + 0 --lastDayCount
	SetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME, lastTime )

	--���ý������ô���....
	lastDayCount2 = lastDayCount2 + 1
	lastTime2 = lastDayTime2 * 100 + lastDayCount2
	SetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME, lastTime2 )

	--ͳ��....
	LuaFnAuditResetPMFCountSmall( sceneId, selfId, lastDayCount2 )

	--��ϲ���ֿ���ȥ��....
	BeginEvent(sceneId)
		AddText(sceneId,"#{XPMCZ_81106_5}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end
