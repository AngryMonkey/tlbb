--���ʦ������

--�ű���
x806009_g_ScriptId	= 806009

--���ʦ��
x806009_g_ExpelPrentice					= {}
x806009_g_ExpelPrentice["Id"]		= 1006
x806009_g_ExpelPrentice["Name"]	= "��Ҫ��ͽ�����ʦ��"

--��ʾ��Ϣ
x806009_g_msg				=
{
	["gld"]= "  ���ͽ����Ҫ����#{_EXCHG%d}��",
	["con"]= "  ����ͽ�ܽ��ᱻ�۳�#{_EXCHG%d}���Ƿ����Ҫ������ң�%s��",
}

--����ͽ�ܣ��۳���Ǯ
x806009_g_Gold			= 25000

--**********************************
--������ں���
--**********************************
function x806009_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local guid
	local PrenticeName
	local	log	= 0
	local	str

	if key == -1 then
		BeginEvent( sceneId )
		for i=0, 7 do
			guid = LuaFnGetPrenticeGUID( sceneId, selfId, i )
			if guid ~= -1 then
				log	= 1
				PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
				AddNumText( sceneId, x806009_g_ScriptId, "��"..PrenticeName.."���ʦ��", 6, i )
			end
		end

		if log == 0 then
			AddText( sceneId, "  �㻹û��ͽ�ܣ�" )
		end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
	if key >= 0 and key <=7 then
		guid	= LuaFnGetPrenticeGUID( sceneId, selfId, key )
		if guid ~= -1 then
			PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
		end
		str	= format( x806009_g_msg["con"], x806009_g_Gold, PrenticeName )
		BeginEvent( sceneId )
			AddText( sceneId, str )
			AddNumText( sceneId, x806009_g_ScriptId, "��", 6, (key+1)*100 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key >= 100 then
		if x806009_CheckAccept( sceneId, selfId, targetId ) > 0 then
			x806009_OnAccept( sceneId, selfId, targetId, floor(key/100)-1 )
		end
	end

end

--**********************************
--�о��¼�
--**********************************
function x806009_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806009_g_ScriptId, x806009_g_ExpelPrentice["Name"], 6, -1 )
end

--**********************************
--����������
--**********************************
function x806009_CheckAccept( sceneId, selfId, targetId )
	--���ʦ�����Ͻ�Ǯ
	--if LuaFnGetMoney( sceneId, selfId ) < x806009_g_Gold then
	--hzp 2008-12-9
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < x806009_g_Gold then
		str	= format( x806009_g_msg["gld"], x806009_g_Gold )
		x806009_MsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x806009_OnAccept( sceneId, selfId, targetId, nIndex )
	
	-- [ QUFEI 2007-08-16 16:53 UPDATE BugID 23624 ]
	local PrenticeGUID = LuaFnGetPrenticeGUID( sceneId, selfId, nIndex )
	if PrenticeGUID == -1 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �㻹û��ͽ�ܣ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		
	local PrenticeName	= LuaFnGetFriendName( sceneId, selfId, PrenticeGUID )
	local selfName	= LuaFnGetName( sceneId, selfId )

	--�۳����Ͻ�Ǯ
	--LuaFnCostMoney( sceneId, selfId, x806009_g_Gold )
	--str	= format( "���ʦͽ��ϵ���۳�#{_MONEY%d}��", x806009_g_Gold )
	--Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--hzp 2008-12-9
	local nMoneyJZ, nMoneyJB = LuaFnCostMoneyWithPriority( sceneId, selfId, x806009_g_Gold )
	--���ֻ�۳����
	if nMoneyJZ == 0 then
		str	= format( "���ʦͽ��ϵ���۳�#{_MONEY%d}��", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--���ֻ�۳�����
	if nMoneyJB == 0 then
		str	= format( "���ʦͽ��ϵ���۳�#{_EXCHG%d}��", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--������н������н��
	if nMoneyJB ~= 0 and nMoneyJZ ~= 0 then
		str	= format( "���ʦͽ��ϵ���۳�#{_EXCHG%d}��#{_MONEY%d}��", nMoneyJZ, nMoneyJB )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	x806009_MsgBox( sceneId, selfId, targetId, "  �����˺�"..PrenticeName.."��ʦͽ��ϵ��" )

	--����ͨ�ʼ���ͽ��
	LuaFnSendSystemMail( sceneId, PrenticeName, "���ʦ��" .. selfName .. "�����ڼ����̵��㣬������������ʦͽ��ϵ��" )
	--LuaFnSendNormalMail( sceneId, selfId, PrenticeName, "���ʦ��" .. selfName .. "�����ڼ����̵��㣬������������ʦͽ��ϵ��" )
	--����ִ���ʼ���ͽ��
	LuaFnSendScriptMail( sceneId, PrenticeName, MAIL_EXPELPRENTICE, 0, 0, 0 )

	--���������Ż�
	LuaFnExpelPrentice( sceneId, selfId, PrenticeGUID )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806009_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
