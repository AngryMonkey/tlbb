--�¼�
--���͵����޵�

--�ű���
x400918_g_ScriptId = 400918

--�����ı�����
x400918_g_MissionName="ȥ���䵺"
x400918_g_MissionInfo="���͵����޵���"  --��������
x400918_g_MissionTarget="���͵����޵���"		--����Ŀ��
x400918_g_ContinueInfo="���͵����޵���"		--δ��������npc�Ի�
x400918_g_MissionComplete="���͵����޵���"					--�������npc˵���Ļ�

--**********************************
--��ں���
--**********************************
function x400918_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--�������
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				BeginEvent( sceneId )
					AddText( sceneId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 39, 109, 25)

end

--**********************************
--�о��¼�
--**********************************
function x400918_OnEnumerate( sceneId, selfId, targetId )
	--�ȼ��ﵽ10������ʾ����ѡ��
	if GetLevel( sceneId, selfId ) >= 10 then
		AddNumText(sceneId,x400918_g_ScriptId,x400918_g_MissionName, 9, -1)
	else
		return
	end
end
