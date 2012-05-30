--��ͽ����

--�ű���
x806008_g_ScriptId = 806008

--��ͽ
x806008_g_Recruit					= {}
x806008_g_Recruit["Id"]		= 1003
x806008_g_Recruit["Name"]	= "�ҵ�ͽ��Ҫ���Ұ�ʦ"

--��ʾ��Ϣ
x806008_g_msg					= {}
x806008_g_msg["tem"]	= "  ��ʦ��ʱ������ͽ��Ϊ���ѹ�ϵ��������Ҫ��������ӵ���ǰ�����ҡ�"
x806008_g_msg["ner"]	= "  ֻ��2�˶��ߵ�����߲ſ��԰�ʦ��"
x806008_g_msg["mlv"]	= "  ʦ���ĵȼ�������ڵ���ͽ��10����"
x806008_g_msg["slv"]	= "  ͽ��10����ʼ�ſɰ�ʦ��"
x806008_g_msg["sib"]	= "  �н�ݹ�ϵ���ܰ�ʦ��"
x806008_g_msg["mar"]	= "  ���޹�ϵ���ܰ�ʦ��"
x806008_g_msg["frp"]	= "  �໥��Ϊ���Ѳ��ܰ�ʦ��"
x806008_g_msg["msl"]	= "  ����������ʦ�µȼ���ֻ��ʦ�µȼ����ڵ���1���˲����ʸ���ͽ��"
x806008_g_msg["rec_3"]	= "  ǿ�н��ʦͽ��ϵ3�������ٴΰ�ʦ��"
x806008_g_msg["rec_2"]	= "  ��ͽ�����Ѵ����"
x806008_g_msg["rec_1"]	= "  �Ѿ���ʦ��������޷���ʦ��"
x806008_g_msg["ts"]	= "  �Ѿ���ʦͽ��ϵ�ˣ����ܰ�ʦ��"

--**********************************
--������ں��� ������ͽ
--**********************************
function x806008_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	if key == -1 then
		local	tId	= x806008_CheckAccept( sceneId, selfId, targetId )
		if tId == 0 then
			return
		end

		local	MasterName		= LuaFnGetName( sceneId, selfId )
		local	ApprenticeName= LuaFnGetName( sceneId, tId )

		--��Է�ȷ���Ƿ�Ը���ʦ
		BeginEvent( sceneId )
				AddText( sceneId, "  ��ʦ֮��ɱ�ֿ��Ի��10���Ķ��⾭��ӳɣ������ʦ����һ����ӣ���ô������20���ľ���ӳɡ�" )
				AddText( sceneId, "  ͽ�ܰ�ʦ֮�󽫻��á�"..MasterName.."�ĵ��ӡ��ĳƺš�" )
				AddText( sceneId, "  ���Ƿ�Ը���"..MasterName.."Ϊʦ��" )
				AddNumText( sceneId, x806008_g_ScriptId, "��", 6, 1 )
				AddNumText( sceneId, x806008_g_ScriptId, "��", 8, 0 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, tId, targetId )

		BeginEvent( sceneId )
			AddText( sceneId, "  �ȴ�"..ApprenticeName.."�𸴡�����" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--BeginEvent( sceneId )
		--	AddText( sceneId, "���Ƿ�Ը���"..MasterName.."Ϊʦ��" )
		--EndEvent( sceneId )
		--DispatchMissionInfo( sceneId, tId, targetId, x806008_g_ScriptId, x806008_g_Recruit["Id"] )

	elseif key == 0 then
		x806008_OnCancel( sceneId, selfId, targetId )

	elseif key == 1 then
		x806008_OnConfirm( sceneId, selfId, targetId )
	end

end

--**********************************
--�о��¼�
--**********************************
function x806008_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806008_g_ScriptId, x806008_g_Recruit["Name"], 6, -1 )
end

--**********************************
--����������
--**********************************
function x806008_CheckAccept( sceneId, selfId, targetId )
	--(1)�����ֻ��ʦͽ������
	if LuaFnHasTeam( sceneId, selfId ) == 0 or LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["tem"] )
		return 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ner"] )
		return 0
	end

	local tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 or LuaFnIsCanDoScriptLogic( sceneId, tId ) ~= 1 then
		return 0
	end

	--(2)ͽ�ܵȼ���10��
	if LuaFnGetLevel( sceneId, tId ) < 10 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["slv"] )
		return 0
	end

	--����ҵ�45�����ٰ�ʦ��
	if LuaFnGetLevel( sceneId, tId ) > 44 then
		x806008_MsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_7}" )
		return 0
	end


	--(3)ʦ���ȼ������ͽ��10��
	if LuaFnGetLevel( sceneId, selfId ) < ( LuaFnGetLevel( sceneId, tId ) + 10 ) then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mlv"] )
		return 0
	end

	--(4)ʦ�µȼ�>0
	local MasterLevel = LuaFnGetmasterLevel( sceneId, selfId )
	if MasterLevel <= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["msl"] )
		return 0
	end

	--(5)�Ƿ��ǽ��
	if LuaFnIsBrother( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["sib"] )
		return 0
	end

	--(6)�Ƿ��Ƿ���
	if LuaFnIsSpouses( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mar"] )
		return 0
	end

	--06.10.24�����µĲ߻��ĵ��Ѿ��Ѵ˲�������ȥ����
	--(7)�Ƿ�ǿ�н��ʦͽ��ϵ����3��
	--if LuaFnGetPrenticeBetrayTime( sceneId, selfId ) < (86400 * 3) then
	--	x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_3"] )
	--	return 0
	--end

	--(8)������ǰͽ�����Ƿ��Ѿ������
	--��������յ���ͽ����
	local PrenticeNum = 2
	if MasterLevel == 1 then
		PrenticeNum = 2
	elseif MasterLevel == 2 then
		PrenticeNum = 3
	elseif MasterLevel == 3 then
		PrenticeNum = 5
	elseif MasterLevel == 4 then
		PrenticeNum = 8
	end
	if LuaFnGetPrenticeCount( sceneId, selfId ) >= PrenticeNum then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_2"] )
		return 0
	end
	
	--(9)�Ƿ�������ʦ��
	if LuaFnHaveMaster( sceneId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_1"] )
		return 0
	end

	--(10)�����Ǻ���
	if LuaFnIsFriend( sceneId, selfId, tId ) ~= 1 or LuaFnIsFriend( sceneId, tId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["frp"] )
		return 0
	end
	
	--(11)�Ƿ��Ѿ���ʦͽ��ϵ��
	if LuaFnIsMaster( sceneId, selfId, tId ) ~= 0 or LuaFnIsMaster( sceneId, tId, selfId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ts"] )
		return 0 
	end

	return tId
end

--**********************************
--����
--**********************************
function x806008_OnAccept( sceneId, selfId, targetId )
	x806008_OnConfirm( sceneId, selfId, targetId )
end

--**********************************
--�ύ
--**********************************
function x806008_OnSubmit( sceneId, selfId, targetId, tId )
	--ͽ������һ���ƺ�
	local	MasterName	= LuaFnGetName( sceneId, tId )
	local	SelfName		= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, MasterName.."�ĵ���" )
	DispatchAllTitle( sceneId, selfId )
	LuaFnAprentice( sceneId, selfId, tId )

	--ʦ��
	x806008_MsgBox( sceneId, tId, targetId, "  ��ϲ��ͽ�ɹ���" )
	Msg2Player( sceneId, tId, "��ϲ��ͽ�ɹ���", MSG2PLAYER_PARA )
	Msg2Player( sceneId, tId, "ʦ��ҪŬ���̺����ͽ����", MSG2PLAYER_PARA )
	str		= format( "��ϲ����%sΪͽ����ͽ֮��ɱ�ֻ�õľ��齫���������5������ͽ��һ����ӣ��ܹ���õ��ƶ�ֵ��������Ϊԭ����160����ͽ�ܴﵽһ���ȼ��󣬻����������֮����Ѻöȸ���������ľ��齱�����˾��������ƶ�ֵ�һ���", SelfName )
	LuaFnSendSystemMail( sceneId, MasterName, str )
	--LuaFnSendNormalMail( sceneId, tId, MasterName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, tId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, tId, tId, tId, 18, 1000 )

	--ͽ��
	x806008_MsgBox( sceneId, selfId, targetId, "  ��ϲ��ʦ�ɹ���" )
	Msg2Player( sceneId, selfId, "��ϲ��ʦ�ɹ���", MSG2PLAYER_PARA )
	str		= format( "��ϲ����%sΪʦ����ʦ֮��ɱ�ֻ�õľ���ֵ�����������10���������ʦ��һ�����ɱ�ֽ����������20����40���Ժ�����⽱������ȡ����", MasterName )
	LuaFnSendSystemMail( sceneId, SelfName, str )
	--LuaFnSendNormalMail( sceneId, selfId, SelfName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
end

--**********************************
--ͬ���ʦ
--**********************************
function x806008_OnConfirm( sceneId, selfId, targetId )
	--tId �Ǽ�����Ϊʦ�������
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--ͽ��
	x806008_MsgBox( sceneId, selfId, targetId, "  ��ͬ���˰ݶԷ�Ϊʦ��" )
	Msg2Player( sceneId, selfId, "��ͬ���˰ݶԷ�Ϊʦ��", MSG2PLAYER_PARA )
	--ʦ��
	x806008_MsgBox( sceneId, tId, targetId, "  �Է�ͬ�����Ϊʦ��" )
	Msg2Player( sceneId, tId, "�Է�ͬ�����Ϊʦ��", MSG2PLAYER_PARA )

	if x806008_CheckAccept( sceneId, tId, targetId ) > 0 then
		x806008_OnSubmit( sceneId, selfId, targetId, tId )
	end
end

--**********************************
--�ܾ���ʦ
--**********************************
function x806008_OnCancel( sceneId, selfId, targetId )
	--tId �Ǽ�����Ϊʦ�������
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--ͽ��
	x806008_MsgBox( sceneId, selfId, targetId, "  ��ܾ��˰ݶԷ�Ϊʦ��" )
	Msg2Player( sceneId, selfId, "��ܾ��˰ݶԷ�Ϊʦ��", MSG2PLAYER_PARA )
	--ʦ��
	x806008_MsgBox( sceneId, tId, targetId, "  �Է��ܾ�����Ϊʦ��" )
	Msg2Player( sceneId, tId, "�Է��ܾ�����Ϊʦ��", MSG2PLAYER_PARA )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806008_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x806008_MsgTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
