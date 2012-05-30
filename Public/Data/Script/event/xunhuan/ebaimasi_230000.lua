--�������������¼��ű�
--����
--�ű���
x230000_g_ScriptId = 230000

--�����
x230000_g_MissionId = 4011

--����Ŀ��npc
x230000_g_Name ="�����ʦ"

--�����ı�����
x230000_g_MissionName="����������"
x230000_g_MissionInfo="�����ӷ�"  --��������
x230000_g_MissionTarget="������������"		--����Ŀ��
x230000_g_ContinueInfo="����������ô?"		--δ��������npc�Ի�
x230000_g_MissionComplete="̫лл����"					--�������npc˵�Ļ�

--ͨ�ü��ű�
x230000_g_CheckScript=500502

--��������
x230000_g_MaxRound=20

--������


--**********************************
--������ں���
--**********************************
function x230000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if GetName( sceneId, targetId ) ~= x230000_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--�������Ѿ����˰���������
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )
		local realMissionScript = GetMissionParam( sceneId, selfId, misIndex, 1 )

		CallScriptFunction( realMissionScript, "OnDefaultEvent", sceneId, selfId, targetId )
	else
		--���δ�Ӱ���������
		--ȡ����Ҹ����Ķ��������������Լ���
		local i = 0
		local mems = { selfId }
		local nearteammembercount = 1

		if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
			if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then		-- �Ƕӳ�
				nearteammembercount = GetNearTeamCount( sceneId, selfId )
				for	i=0, nearteammembercount-1 do
					mems[i+1] = GetNearTeamMember(sceneId, selfId, i)
				end
			end
		end

		local rand = random( 230011, 230012 )
		for	i=1, nearteammembercount do
			CallScriptFunction( rand, "OnDefaultEvent", sceneId, mems[i], targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x230000_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x230000_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 or x230000_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x230000_g_ScriptId, x230000_g_MissionName,4,-1 )
    end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x230000_CheckAccept( sceneId, selfId )
	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
		return 0
	end

	--����Ƿ������Ѿ��ﵽ20��,�������,���ܽ�
	if GetMissionCount( sceneId, selfId ) == 20 then
		x230000_NotifyFailTips( sceneId, selfId, "�޷����ܸ�������" )
		return 0
	end

	--��Ҫ15�����ܽ�
	if GetLevel( sceneId, selfId ) >= 15 then
		--�������Ƿ���Ͻ������������
		--begin modified by zhangguoxin 090207
		--local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
		--local iTime = mod( iDayCount, 100000 )
		local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
		local iDayTime = floor( iTime/100 )			--��һ�ν�����������ʱ��(����)
		local iQuarterTime = mod( iTime, 100 )		--��һ�ν�����������ʱ��(һ����)
		--local iDayHuan = floor( iDayCount/100000 )	--��������ɵ��������

		--local CurTime = GetHourTime()				--��ǰʱ��
		local CurTime = GetQuarterTime()				--��ǰʱ��
		local CurDaytime = floor( CurTime/100 )		--��ǰʱ��(��)
		local CurQuarterTime = mod( CurTime, 100 ) 	--��ǰʱ��(һ����)

		if iDayTime == CurDaytime then
			if CurQuarterTime == iQuarterTime then
				x230000_NotifyFailTips( sceneId, selfId, "�����ڲ�����ȡ�������" )
				return 0
			end
		end
		--end modified by zhangguoxin 090207
		return 1
	else
		return 0
	end
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x230000_OnAccept( sceneId, selfId, targetId, scriptId )
 	if GetName( sceneId, targetId ) ~= x230000_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x230000_g_MissionId, scriptId, 0, 0, 1 )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )		--�õ���������к�
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, scriptId )					--�������кŰ���������ĵ�1λ��Ϊ����ű���

	--�õ�����
	local MissionRound = GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--��������1
	MissionRound = MissionRound + 1
	if	MissionRound > x230000_g_MaxRound then
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 1 )
	else
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound )
	end

end

--**********************************
--�������������������
--**********************************
function x230000_OnAbandon( sceneId, selfId )
    DelMission( sceneId, selfId, x230000_g_MissionId )
	-- SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 0 )	--��������0���������ɷ���

	--begin modified by zhangguoxin 090207
	--local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iDayHuan = floor( iDayCount/100000 )					--��������ɵ��������
	--local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)							--��һ�ν�����������ʱ��(����)
	--local CurTime = GetHourTime()								--��ǰʱ��
	--local CurDaytime = floor(CurTime/100)						--��ǰʱ��(��)
  --
	--if iDayTime ~= CurDaytime then								--���ǽ���Ļ������� 0
	--	iDayHuan = 0
	--end
  --
	--iDayCount = iDayHuan * 100000 + CurTime
	----����ѭ�������ʱ��
	--SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime = floor(iTime/100)																			--��һ�ν�����������ʱ��(����) 
	local CurTime = GetQuarterTime()																			--��ǰʱ��
	local CurDaytime = floor(CurTime/100)																	--��ǰʱ��(��)
	if iDayTime ~= CurDaytime then
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, 0 )						--���ǽ���Ļ������� 0
	end
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
	
	--end modified by zhangguoxin 090207
end

--**********************************
--����
--**********************************
function x230000_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230000_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )			--�õ���������к�
	if GetMissionParam( sceneId, selfId, misIndex, 0 ) >= 1 then
		return 1
	end

	return  0
end

--**********************************
--�ύ���������������
--**********************************
function x230000_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x230000_CheckSubmit( sceneId, selfId ) == 1 then
		if DelMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
			local Level = GetLevel( sceneId, selfId )
			
			--begin modified by zhangguoxin 090207
			local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
			--local iTime = mod( iDayCount, 100000 )
			local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
			local iDayTime = floor( iTime/100 )				--��һ�ν�����������ʱ��(����)
			local iQuarterTime = mod( iTime, 100 )			--��һ�ν�����������ʱ��(��)
			--local iDayHuan = floor( iDayCount/100000 )		--��������ɵ��������
			local iDayHuan = iDayCount		--��������ɵ��������

			--local CurTime = GetHourTime()					--��ǰʱ��
			local CurTime = GetQuarterTime()					--��ǰʱ��
			local CurDaytime = floor( CurTime/100 )			--��ǰʱ��(��)
			local CurQuarterTime = mod( CurTime, 100 )		--��ǰʱ��(��)

			if CurDaytime == iDayTime then				 	--�ϴ����������ͬһ����
				iDayHuan = iDayHuan + 1
			else											--�ϴ����������ͬһ�죬����
				iDayTime			= CurDaytime
				iQuarterTime	= 0
				iDayHuan			= 1
			end

			--iDayCount = iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
			iDayCount = iDayHuan
			local newTime = iDayTime * 100 + iQuarterTime

			local Reward_Append = 1
			if iDayHuan <= 20 then
				Reward_Append = 2
			end

			--����ѭ������Ļ���
			SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
			SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, newTime )
			--end modified by zhangguoxin 090207
			
			local MissionRound = GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )

			--˥��ϵ��
			local l_Exp = 0.75
			local l_Money = (49 + Level) / (160 + 40 * Level )
			--���㽱�����������
			local Round = mod( MissionRound, 10 )
			if Round == 0 then
				Round = 10
			end

			local Exp = 2400 * (Level+4) * Round * l_Exp / 120					--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
			local Money = 2400 * (Level+4) * Round * l_Money /120				--�ȼ�+�����������ܾ�����ڳ�����Ӱ��

			if MissionRound > 10 then
				Exp = 2400 * (Level+4) * l_Exp / 120 + Exp						--11~20������ÿ����������һ��������������Ǯû������
			end

			Exp = Exp * Reward_Append

			Exp = floor(Exp)
			Money = floor(Money)

			--���Ӿ���ֵ��Ǯ
			--���������
			AddExp( sceneId, selfId, Exp )
			AddMoney( sceneId, selfId, Money )
			--��ʾ�Ի���
			BeginEvent( sceneId )
				AddText( sceneId, "  ���ò���������" .. Exp .. "�㾭��ֵ��#{_MONEY"..Money.."}�����Ǹ���Ľ�����" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x230000_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x230000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x230000_AcceptDialog(sceneId, selfId,rand,g_Dialog,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,g_Dialog)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x230000_SubmitDialog(sceneId, selfId,rand)

end

--**********************************
--�����͵�����ʾ�Ľ���
--**********************************
function x230000_SubmitDialog(sceneId, selfId,rand)

end

function x230000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x230000_GetEventMissionId(sceneId, selfId)
	return x230000_g_MissionId
end
