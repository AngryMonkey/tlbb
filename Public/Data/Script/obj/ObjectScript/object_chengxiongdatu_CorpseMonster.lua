--��̬���ɵĽ�ʬ

x807001_g_scriptId=807001



--**********************************

--�¼��������

--**********************************

function x807001_OnDefaultEvent( sceneId, selfId, targetId )

	--�ж��Ƿ��ܹ������npc������

	--PrintStr("haha...���ǽ�ʬ")

	local npcLevel = GetCharacterLevel(sceneId, targetId)

	local teamCount = GetTeamMemberCount(sceneId, selfId)

	local teamLeaderID = GetTeamLeader(sceneId, selfId)

	local teamLeaderLevel = GetCharacterLevel(sceneId, teamLeaderID)

	

	--PrintNum(teamLeaderID)

	--PrintNum(teamCount)

	--PrintNum(teamLeaderLevel)

	--PrintNum(npcLevel)

	
	--ȡ����Ҹ����Ķ��������������Լ���
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if  nearteammembercount < 3 then	

		BeginEvent(sceneId)

			AddText(sceneId, "����С���ң�����3����Ӳ�����, ������")

		EndEvent(sceneId)

		DispatchEventList(sceneId,selfId,targetId)

		return

	elseif teamLeaderLevel < npcLevel then

		--��ʾ��������

		BeginEvent(sceneId)

			AddText(sceneId, "����С���ң��ȼ��ٸ�Щ��֪���ҵ�������")

		EndEvent(sceneId)

		DispatchEventList(sceneId,selfId,targetId)

		return



	else

		--����npc

		--PrintStr("active npc...")

		--���öԹ�Ϊ�жԵ� Ŀǰ��28���ǵжԵģ�������˸ı�����Ӧ�������������ҾͲ��ˣ���:-(((
		SetUnitReputationID(sceneId, selfId, targetId, 28)


	end

	

end



function x807001_OnDie(sceneId, selfId, killerId)



end

