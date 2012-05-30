--�������

--�ű���
x806018_g_ScriptId					= 806018

--ÿ������ðﹱ�һ��ľ������Ϊ200*600=12���
x806018_g_AssignExpDateMax	= 120000

--**********************************
--������ں���
--**********************************
function x806018_OnDefaultEvent( sceneId, selfId, targetId )

	local	nMlevel	= LuaFnGetmasterLevel( sceneId, selfId )
	if nMlevel < 1 or nMlevel > 4 then
		x806018_MsgBox( sceneId, selfId, targetId, "  ʦ�µȼ�����" )
		return
	end
	if LuaGetPrenticeSupplyExp( sceneId, selfId ) == 0 then
		x806018_MsgBox( sceneId, selfId, targetId, "  û�п�����ȡ�ľ��顣" )
		return
	end
	
	--��ȡ����
	local	nOldTime		= GetMissionData( sceneId, selfId, MD_PEXP_GP_TIME )
	local	nOldValue		= GetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE )
	local	nNewTime		= GetDayTime()
	if nOldTime == nNewTime and nOldValue >= x806018_g_AssignExpDateMax then
		x806018_MsgBox( sceneId, selfId, targetId, "  �������ð��ɹ��׶ȶһ��ľ����Ѵ����ޣ�������������ȡ��" )
		return
	end
	
	--�򿪿ͻ��˰��ɹ��׶ȶһ����鴰��
	LuaFnExpAssign( sceneId, selfId, 2 )
	--�رմ���
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 ) 

end

--**********************************
--�о��¼�
--**********************************
function x806018_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x806018_g_ScriptId, "�����ð��ɹ��׶���ȡ����", 6, -1 )

end

--**********************************
--C++�ص��ӿڣ�
--��ṱ�׶���ȡʦ������
--**********************************
function x806018_CallBackExpAssignByGuildPoint( sceneId, selfId, nExp )

	--�Ƿ����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end

	local	nAssignExp	= nExp
	local	nMlevel			= LuaFnGetmasterLevel( sceneId, selfId )
	if nMlevel < 1 or nMlevel > 4 then
		x806018_MsgTip( sceneId, selfId, "ʦ�µȼ�����" )
		return 0
	end
	if nAssignExp < 0 or nAssignExp > LuaGetPrenticeSupplyExp( sceneId, selfId ) then
		x806018_MsgTip( sceneId, selfId, "��ȡ����ֵ����" )
		return 0
	end
	if IsLocked( sceneId, selfId, 0 ) == 1 then
		x806018_MsgTip( sceneId, selfId, "���ɹ��׶����������Ժ�����" )
		return 0
	end
	
	--��ȡ����
	local	nOldTime		= GetMissionData( sceneId, selfId, MD_PEXP_GP_TIME )
	local	nOldValue		= GetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE )
	local	nNewTime		= GetDayTime()
	if nOldTime == nNewTime and nOldValue >= x806018_g_AssignExpDateMax then
		x806018_MsgTip( sceneId, selfId, "���նһ�������" )
		return 0
	end
	if nOldTime ~= nNewTime then
		nOldValue				= 0
	end
	if nAssignExp + nOldValue > x806018_g_AssignExpDateMax then
		nAssignExp			= x806018_g_AssignExpDateMax - nOldValue
		x806018_MsgTip( sceneId, selfId, "ÿ�նһ�����Ϊ"..x806018_g_AssignExpDateMax.."�㾭�飬����ʣ��"..nAssignExp.."��" )
	end
	
	local	nBasePoint	= 0
	if nMlevel == 1 then
		nBasePoint			= 250
	elseif nMlevel == 2 then
		nBasePoint			= 300
	elseif nMlevel == 3 then
		nBasePoint			= 400
	elseif nMlevel == 4 then
		nBasePoint			= 600
	end
	local	nGPValue		= ceil( nAssignExp / nBasePoint )
	if nGPValue > CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT ) then
		x806018_MsgTip( sceneId, selfId, "���ɹ��׶Ȳ���" )
		return 0
	end
	--���ٰ��ɹ��׶�
	CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -nGPValue )
	--����ͽ�ܹ��׵ľ���
	LuaAddPrenticeProExp( sceneId, selfId, 0, -nAssignExp )
	--���Ӿ���
	AddExp( sceneId, selfId, nAssignExp )
	--����ͳ��
	LuaFnAuditMasterExp( sceneId, selfId, nGPValue, nAssignExp, 2 )

	--��ȡ��¼
	if nOldTime ~= nNewTime then
		SetMissionData( sceneId, selfId, MD_PEXP_GP_TIME, nNewTime )
		SetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE, nAssignExp )
	else
		SetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE, nOldValue + nAssignExp )
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806018_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x806018_MsgTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
