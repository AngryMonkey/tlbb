--�ؾ���NPC
--������ɮ
--��ͨ

x122001_g_ScriptId	= 122001



--**********************************
--�¼��������
--**********************************
function x122001_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "  �����ӷ��������ա�#r  һ����Ϊ����Ϊ�λ���Ӱ��#r  ��¶����磬�������ǹۡ�#r  $N��ȥ֮����������ã�������ɮָ�����㡣" )
		AddNumText( sceneId, x122001_g_ScriptId, "���� - ����", 9, 1001 )
		AddNumText( sceneId, x122001_g_ScriptId, "���� - ����", 9, 1002 )
		AddNumText( sceneId, x122001_g_ScriptId, "���� - ����", 9, 1003 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x122001_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x122001_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x122001_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end

	--˳������
	local	arg	= GetNumText()

	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 141 )
		return
	end
	if arg == 1003 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183 )
		return
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x122001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
