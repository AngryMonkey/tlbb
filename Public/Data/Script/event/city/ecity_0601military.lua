
-- ��������׽�ü�ϸ
--MisDescBegin
-- �ű���
x600031_g_ScriptId = 600031

--�����
x600031_g_MissionId = 1109

--����Ŀ��npc
x600031_g_Name = "�����"

--�������
x600031_g_MissionKind = 50

--����ȼ�
x600031_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600031_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600031_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���
--�����ı�����
x600031_g_MissionName = "��������"
x600031_g_MissionInfo = ""													--��������
x600031_g_MissionTarget = "    ʹ��Ѳ������¿��ɵ��ˡ�"	--����Ŀ��
x600031_g_ContinueInfo = "    �����չ����Σ�"						--δ��������npc�Ի�
x600031_g_MissionComplete = "    �ɵò����������á�"						--�������npc˵���Ļ�

x600031_g_MissionRound = 79

-- ͨ�ó�������ű�
x600031_g_CityMissionScript = 600001
x600031_g_MilitaryScript = 600030

--MisDescEnd

x600031_g_MonsterId = {
{n=100,id=3550},{n=101,id=3551},{n=102,id=3552},{n=103,id=3553},{n=104,id=3554},{n=105,id=3555},{n=106,id=3556},{n=107,id=3557},{n=108,id=3558},{n=109,id=3559},
{n=110,id=3560},{n=111,id=3561},{n=112,id=3562},{n=113,id=3563},{n=114,id=3564},{n=115,id=3565},{n=116,id=3566},{n=117,id=3567},{n=118,id=3568},{n=119,id=3569},
{n=120,id=3570},{n=121,id=3571},{n=122,id=3572},{n=123,id=3573},{n=124,id=3574},{n=125,id=3575},{n=126,id=3576},{n=127,id=3577},{n=128,id=3578},{n=129,id=3579},
{n=130,id=3580},{n=131,id=3581},{n=132,id=3582},{n=133,id=3583},{n=134,id=3584},{n=135,id=3585},{n=136,id=3586},{n=137,id=3587},{n=138,id=3588},{n=139,id=3589},
{n=140,id=3590},{n=141,id=3591},{n=142,id=3592},{n=143,id=3593},{n=144,id=3594},{n=145,id=3595},{n=146,id=3596},{n=147,id=3597},{n=148,id=3598},{n=149,id=3599},
{n=150,id=3600},{n=151,id=3601},{n=152,id=3602},{n=153,id=3603},{n=154,id=3604},{n=155,id=3605},{n=156,id=3606},{n=157,id=3607},{n=158,id=3608},{n=159,id=3609},
{n=160,id=3610},{n=161,id=3611},{n=162,id=3612},{n=163,id=3613},{n=164,id=3614},{n=165,id=3615},{n=166,id=3616},{n=167,id=3617},{n=168,id=3618},{n=169,id=3619},
{n=170,id=3620},{n=171,id=3621},{n=172,id=3622},{n=173,id=3623},{n=174,id=3624},{n=175,id=3625},{n=176,id=3626},{n=177,id=3627},{n=178,id=3628},{n=179,id=3629},
{n=180,id=3630},{n=181,id=3631},{n=182,id=3632},{n=183,id=3633},{n=184,id=3634},{n=185,id=3635},{n=186,id=3636},{n=187,id=3637},{n=188,id=3638},{n=189,id=3639},
}

x600031_g_MonsterName = {
"��",
"��",
"��",
"��",
"��",
"�׶�",
"С��",
"�Ҷ�",
"С��",
"����",
}

--**********************************
--������ں���
--**********************************
function x600031_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) > 0 then
		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600031_g_MissionName )
			AddText( sceneId, x600031_g_ContinueInfo )
		EndEvent( )
		local bDone = x600031_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600031_g_ScriptId, x600031_g_MissionId, bDone )
	--���������������
	elseif x600031_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600031_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600031_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x600031_OnEnumerate( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) > 0 then
		AddNumText( sceneId, x600031_g_ScriptId, x600031_g_MissionName, 2 )
	end
	
end

--**********************************
--����
--**********************************
function x600031_OnAccept( sceneId, selfId, targetId )
	
	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600031_g_MissionId, x600031_g_ScriptId, 1, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600031_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600031_g_ScriptId )

	-- ����������ص�������Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, 40004413, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	
	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    ������������˹������������Ѳ����ڳ����Ĵ�תת��" )
		else
			missionInfo = format( "    ά�ֳ��а�ȫ�����ǵ����Σ����Ѳ������㣬����Щ�ɼ�����" )
		end

		AddText( sceneId, "�����������" .. x600031_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	-- ������������һЩ������۵ı�Ҫ����
	-- �����Ǹ�����ҵĵȼ������һ�����������
	local randMenpai = random( 9 ) - 1
	local nLevel = GetLevel(sceneId, selfId)
	local nIndex = 100 + randMenpai*10 + floor(nLevel/10)-1
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600031_g_MissionId)
	if nIndex>=100 and nIndex<189   then
		SetMissionByIndex(sceneId, selfId, misIndex, 5, nIndex)
	else
		SetMissionByIndex(sceneId, selfId, misIndex, 5, 189)
	end
	
	-- ������������
	local nXin = random(4)
	local nMing = random(4) + 4
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nXin)
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nMing)

end

--**********************************
--����������
--**********************************
function x600031_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600031_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600031_CheckSubmit( sceneId, selfId )
	--��ѯ���������ǲ����������õ���Ʒ��
	if GetItemCount( sceneId, selfId, 40004254 ) < 1   then
		return 0
	end
	return 1
end

--**********************************
--��������
--**********************************
function x600031_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600031_g_MilitaryScript, "OnAbandon", sceneId, selfId )
	
	--ɾ��������Ʒ
	DelItem( sceneId, selfId, 40004254, 1 )
	DelItem( sceneId, selfId, 40004413, 1 )
	
end

--**********************************
--ɱ����������
--**********************************
function x600031_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600031_g_MissionId )		--�õ�������20�������е����к�

	local monsterName = GetName(sceneId, objId)
	
	local nXin = GetMissionParam(sceneId, selfId, misIndex, 6)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local nMingzi = x600031_g_MonsterName[nXin] .. x600031_g_MonsterName[nMing]
	
	if monsterName == nMingzi   then
		-- ����������ص�������Ʒ
		BeginAddItem( sceneId )
			AddItem( sceneId, 40004254, 1 )
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then 
			return
		end
		AddItemListToHuman(sceneId,selfId)
		SetMissionByIndex( sceneId, selfId, misIndex, x600031_g_IsMissionOkFail, 1 )
	end
end

--**********************************
--����
--**********************************
function x600031_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600031_g_MissionName )
		AddText( sceneId, x600031_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600031_g_ScriptId, x600031_g_MissionId )
end

--**********************************
--�ύ
--**********************************
function x600031_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end
	
	if x600031_CheckSubmit( sceneId, selfId ) == 1 then
		-- ɾ�����������Ҫɾ������Ʒ
		CallScriptFunction( x600031_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

		DelItem( sceneId, selfId, 40004254, 1 )
		
		-- ��������λ����Ϣ
		SetMissionData( sceneId, selfId, MD_MILITARY_ROND_POSITION, 0)
	end
end

