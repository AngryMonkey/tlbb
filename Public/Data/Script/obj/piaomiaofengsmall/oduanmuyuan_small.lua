--��翷帱��....
--��ľԪ�Ի��ű�....

--�ű���
x402287_g_ScriptId	= 402287

--�����߼��ű���....
x402287_g_FuBenScriptId = 402276

--**********************************
--����....
--**********************************
function x402287_OnDie( sceneId, selfId, killerId )

	--�����û����ս������ˮ�������ս����ˮ....
	if 2 ~= CallScriptFunction( x402287_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" )	then
		CallScriptFunction( x402287_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "LiQiuShui", 1 )
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
		str = format("#{XPM_8724_5}#{_INFOUSR%s}#{XPM_8724_6}", playerName);  --��ƽ��
		AddGlobalCountNews( sceneId, str )
	end

end
