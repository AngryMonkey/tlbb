--��翷帱��....
--��ľԪ�Ի��ű�....

--�ű���
x890074_g_ScriptId	= 890074

--�����߼��ű���....
x890074_g_FuBenScriptId = 890063

--**********************************
--����....
--**********************************
function x890074_OnDie( sceneId, selfId, killerId )

	--�����û����ս������ˮ�������ս����ˮ....
	if 2 ~= CallScriptFunction( x890074_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" )	then
		CallScriptFunction( x890074_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "DingChunQiu", 1 )
	end
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("����ɽ#{_INFOUSR%s}����Ķ���һ·�߸裬�����#Y��ɽͯ��#W��#Y��ɽͯ��#W����ǰץס#{_INFOUSR%s}�Ŀ�ţ�����Թ�޵�˵��������������Ҳ����", playerName,playerName); --��ƽ��
		AddGlobalCountNews( sceneId, str )
	end
end
