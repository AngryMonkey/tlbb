--����ɱ
--�������
--������ͼ��СΪ256*256��������64*64��16��С����

--�ű���
x808002_g_ScriptId			= 808002
x808002_g_ScriptId_Ctrl	= 808003		--�ص��ű�

x808002_g_PlyJoinMax		= 64				--���������
x808002_g_GoldMin				= 10000			--������
x808002_g_LevelMin			= 40				--��͵ȼ�����
x808002_g_GodBuff				= 112				--�޵�BUFF
x808002_g_CampA					= 10				--��սA����Ӫ��
x808002_g_CampB					= 11				--��սB����Ӫ��
x808002_g_BackCity			=						--�س�����
{
	["scn"]	= 1,
	["px"]	= 183,
	["pz"]	= 140,
}

--�������
x808002_g_CopySceneName	= "����᳡"		--��������
x808002_g_CopySceneType	= FUBEN_DATAOSHA--�������ͣ�������ScriptGlobal.lua����
x808002_g_CopySceneMap	= "dataosha.nav"
x808002_g_TickTime			= 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x808002_g_CloseTick			= 6					--�����ر�ǰ����ʱ����λ��������
x808002_g_NoUserTime		= 600				--������û���˺���Լ��������ʱ�䣨��λ���룩
x808002_g_PvpRuler			= 5					--����Pvp���򣬿�PK
x808002_g_JoinTick			= 3					--��������ʱ

--��������������
x808002_g_ScnParam			=
{
	["typ"]	= 0,	--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	["sid"]	= 1,	--��1����������Ϊ���������¼��ű���
	["tim"]	= 2,	--���ö�ʱ�����ô���
	["ent"]	= 3,	--���ø�����ڳ�����, ��ʼ��
	["cls"]	= 4,	--���ø����رձ�־, 0���ţ�1�ر�
	["rnd"]	= 5,	--���õڼ��غ�
	["jon"]	= 6,	--���ñ�������ʱ����
	["chk"]	= 7,	--����У��ʱ���
	["tab"]	= 8,	--���ñ�ID
}

--���а������������
x808002_g_TabParam			=
{
	["enn"]	= 0,	--���븱��������
	["fbn"]	= 1,	--ʹ�ø�������
	["fb1"]	= 2,	--����1��SceneId
	["fb2"]	= 3,	--����2��SceneId
	["fbs"]	= 4,	--�����Ĵ���״̬��0(����)��1(������)
}

--��Ϣ��ʾ
x808002_g_Msg						=
{
	["flw"]		= "�Բ�����Ӹ���״̬�²��ܱ�����",
	["drd"]		= "�Բ���˫�����״̬�²��ܱ�����",
	["ear"]		= "���ڲ��ǻ��ʼ������ʱ�䣬���ڱ���ʱ�����������ҡ�",
	["pop1"]	= "  ������������ʽ��ʼ����һ�βμӱ�����Ҫÿ�˽���#{_EXCHG"..x808002_g_GoldMin.."}�ı����ѣ����Ƿ�Ը��μӣ�",
	["gld"]		= "�����ϵ��ֽ���#{_EXCHG"..x808002_g_GoldMin.."}��������ֽ�֮�������ұ�����",
	["itm"]		= "���ı����������һ����λ����״Ԫ���н������ϣ�",
	["ful"]		= "�Բ��𣬺����ȼ�������鼶�ı��������Ѿ��㹻�����´������μӡ�",
	["lev"]		= "�Բ���ֻ��"..x808002_g_LevelMin.."�����ϲ��ܲμӴ˱�����",
	["grp"]		= "�Բ��𣬺����ȼ��������ı�����û�п��š�",
	["popn"]	= "  ��������һ�ֱ�����ı���ʱ�䣬ֻ����һ�ֵ�ʤ�߲��ܲμ���һ�ֵı�����",
	["fal"]		= "�Բ���ֻ����һ�ֱ�����Ļ�ʤ�߲��ܲμ���һ�ֵı�����",

	["n_son"]	= "������%d�����鱾�λ������%d���Ӻ���������λѡ�־������������",
	["n_end"]	= "������%d�����鱾�λ�Ѿ��������������һ�ֵ�ѡ�־���׼��������",
	["r_win"]	= "��ϲ�������ʤ",
	["r_wnx"]	= "�뵽�屪������ȡ���Ľ�����֮����ܽ�����һ�ֱ���",
	["r_mal"]	= "��ϲ��Ӯ�ñ��䣡�뵽�屪����173��130������ȡ���Ľ���������ЪϢ������������һ�ֱ��䡣#rע�⣺��ֻ����ȡ�������Ż������һ�֣���Ҫ��ʧ����Ŷ���Ͽ�ȥ��ȡ�ɡ�",
	["r_fal"]	= "�ź�������ʧ��",
	["r_flx"]	= "�뵽�屪������ȡ���Ľ���",
}

--ʧ���߽���
x808002_g_BountyRate		= 5	--�������ʰٷֱ�
x808002_g_BountyItem	 	=		--������Ʒ�б�
{
	20500000,									--������Ƭ
	20501000,									--�޲���Ƭ
	20502000,									--������Ƭ
}

--**********************************
--������ں���
--**********************************
function x808002_OnDefaultEvent( sceneId, selfId, targetId )

	--�Ҳ��������
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end
	--�ж���Ӹ���״̬
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["flw"] )
		return
	end
	--�ж�˫�����״̬
	if LuaFnGetDRideFlag( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["drd"] )
		return
	end

	--����غ���
	local	rnd	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )

	--ѡ��ť
	local	key	= GetNumText()

	--��Ҫ����
	if key == 0 then
		--�鿴���������Ƿ���ȡ������
		if x808002_OnPlyBounty( sceneId, selfId, targetId, rnd ) == 1 then
			if rnd > 0 then
				x808002_MsgBox( sceneId, selfId, "�벻Ҫ����̫Զ���Ժ󽫹�������ɼ�" )
			end
			return
		end

		--��Ƿ��ڱ�����
		if CallScriptFunction( x808002_g_ScriptId_Ctrl, "IsJoinDoing", sceneId, selfId ) == 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ear"] )
			return
		end
		
		--��ⱨ������
		if x808002_CheckPlyJoin( sceneId, selfId ) ~= 1 then
			return
		end

		--��һ�β���
		if rnd == 1 then
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["pop1"] )
			AddNumText( sceneId, x808002_g_ScriptId, "�����ھ�Ҫ�μ�", 10, 1001 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		--ѭ����
		else
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["popn"] )
			AddNumText( sceneId, x808002_g_ScriptId, "�����ھ�Ҫ�μ�", 10, 1002 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end

	--��һ�֣������ھ�Ҫ�μ�
	elseif key == 1001 then
		--�رս���
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)
		
		--��Ǯ���
		if (nMoneyJZ + nMoney) < x808002_g_GoldMin then
			-- Ǯ����
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["gld"] )
			return
		end

		x808002_MsgBox( sceneId, selfId, "��ϲ���Ѿ������ɹ���ϣ��������ܹ��¶���״Ԫ!" )
		x808002_MsgBox( sceneId, selfId, "�뿪�᳡�󣬼ǵü�ʱ������ȡ����Ŷ!" )

		--��ұ���
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	
	--ѭ���������ھ�Ҫ�μ�
	elseif key == 1002 then
		--�رս���
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		--��ұ���
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	end

end

--**********************************
--�о��¼�
--**********************************
function x808002_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x808002_g_ScriptId, "��Ҫ����", 4, 0 )

end

--**********************************
--�����ұ�������
--**********************************
function x808002_CheckPlyJoin( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < x808002_g_LevelMin then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["lev"] )
		return 0
	end
	
	--������ҵȼ���ȡ�����Ϣ
	local	ActID, _, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, selfId )
	if ActID == nil then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["grp"] )
		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["itm"] )
		return 0
	end
	return 1

end

--**********************************
--��ұ���
--**********************************
function x808002_OnPlyJoin( sceneId, selfId, rnd )

	--�Ҳ��������
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--����غ���
	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if rnd > 1 then
		if rnd ~= (rnd_self+1) or ret_self <= 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			return
		end
	end

	--��ȡ��ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--������
	ply_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	if tabId == -1 or ply_num >= x808002_g_PlyJoinMax then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

	--�жϸ����Ƿ����
	scn_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	scn_fb		= { 0, 0 }
	scn_fb[1]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"] )
	scn_fb[2]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"] )
	if scn_num > 0 then
		--����������Ϊ��x808002_g_PlyJoinMax/2��ʱ����������2
		if LuaFnGetSceneType( scn_fb[scn_num] ) == 1 and ply_num ~= floor(x808002_g_PlyJoinMax/2) then
			x808002_OnSelectRoom( sceneId, selfId, scn_fb[scn_num], tabId )
			return
		end
	end

	--һ��Ҫ���ǡ����������С���״��
	if scn_num <= 2 then
		if HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"] ) == 0 then
			HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 1 )
			x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )
		else
			x808002_MsgBox( sceneId, selfId, "����������" )
			return
		end

	else
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, scn_num=%d, fb1=%d, fb2=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			scn_num, scn_fb[1], scn_fb[2],
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

end

--**********************************
--��ҽ���
--**********************************
function x808002_OnPlyBounty( sceneId, selfId, targetId, rnd )

	--�������������"����λ"��ʶʤ��������"����ֵ�Ƿ����1"��ʶ�Ƿ���ȡ��������0��ͬ��û�й�����
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if abs( ret_self ) <= 1 then
		return 0
	end
	--�Ƿ��ʤ
	if ret_self > 0 then
		isWin		= 1
	else
		isWin		= 0
	end

	ret_self	= floor( ret_self / abs(ret_self) )
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, ret_self )

	--�ֳ�ʤ�����飬������ʤ���߻���ʧ���߾����Ի�þ���
	BeginEvent( sceneId )
		AddText( sceneId, "  �������������ɼΣ�������׼����һЩСС���������Ц�ɡ�" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	--���Ӿ���ֵ
	exp				= GetLevel( sceneId, selfId ) * 44
	AddExp( sceneId, selfId, exp )

	--��ȡ�����ٽ�������
	--���ɣ����յȼ�����Ϊ���飬ÿ���Ӧ�ั�������߳�
	--��ȡ��ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlyBounty( sceneId=%d, GUID=%0X ), AddExp=%d, tabId=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		exp, tabId )
	MissionLog( sceneId, LogInfo )

	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	if tabId < 0 or rnd <= 0 or rnd_self <= 0 then
		return 0
	end
	guid			= LuaFnObjId2Guid( sceneId, selfId )
	--���м�ֵ�����򣬼�ֵԽ������Խ��ǰ�������� * 3 ��ʤ�߼�2�����߼�1
	key				= rnd_self * 3
	if ret_self > 0 then
		key			= key + 2				--ʤ��
	elseif ret_self < 0 then
		key			= key + 1				--����
	end
	HitParadePlayerJoin( sceneId, tabId, guid, key )
	
	--ʧ���߶��⽱��
	if isWin == 0 and
		random( 100 ) <= x808002_g_BountyRate and
		LuaFnGetPropertyBagSpace( sceneId, selfId ) >= 1
		then
		idLst		= random( getn( x808002_g_BountyItem ) )
		idBag		= LuaFnTryRecieveItem( sceneId, selfId, x808002_g_BountyItem[idLst], 1 )
		if idBag >= 0 then
			LuaFnItemBind( sceneId, selfId, idBag )
			szTran= GetBagItemTransfer( sceneId, selfId, idBag )
			szMsg	= format( "�������������䳡�ϣ�#{_INFOUSR%s}����ּ�ս�������䲻���������һ�����#{_INFOMSG%s}��",
				LuaFnGetName( sceneId, selfId ),
				szTran )
			x808002_MyGlobalNews( sceneId, szMsg )
		end
	end
	
	return 1

end

--**********************************
--��������
--**********************************
function x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )

	--��ȡ��������
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	--��ȡ����ִ��ʱ��
	unt_tim	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetCurrentUnitTime", sceneId, selfId, x808002_g_TickTime )

	--���ø�������
	local	leaderguid	= LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x808002_g_CopySceneMap )							--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_PvpRuler( sceneId, x808002_g_PvpRuler )
	LuaFnSetCopySceneData_Timer( sceneId, x808002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"], x808002_g_CopySceneType )			--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["sid"], x808002_g_ScriptId )						--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], 0 )	--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["ent"], -1 )	--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )	--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"], rnd )--���õڼ��غ�
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], 0 )	--���ñ�������ʱ����

	LuaFnSetSceneLoad_Area( sceneId, "dataosha_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "dataosha_monster.ini" )

	--����У��ʱ���
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"], unt_tim )
	--���ñ�ID
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tab"], tabId )

	--��ʼ����ɺ���ô�����������
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )
	if bRetSceneID > 0 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"], scn_num + 1 )
		x808002_MsgBox( sceneId, selfId, "���������ɹ�" )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )
		x808002_MsgBox( sceneId, selfId, "���������Ѵ����ޣ����Ժ�����" )
	end

end

--**********************************
--�����¼�
--**********************************
function x808002_OnCopySceneReady( sceneId, destsceneId )

	--���ø�����ڳ�����
	LuaFnSetCopySceneData_Param( destsceneId, x808002_g_ScnParam["ent"], sceneId )
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local	leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )

	--��ȡ��ID
	tabId		= LuaFnGetCopySceneData_Param( destsceneId, x808002_g_ScnParam["tab"] )

	--���ø����ĳ�����
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	if scn_num == 1 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"], destsceneId )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"], destsceneId )
	end
	--�����������
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )

	--ѡ�񷿼�
	x808002_OnSelectRoom( sceneId, leaderObjId, destsceneId, tabId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnCopySceneReady( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, scn_num=%d",
		sceneId, destsceneId, leaderguid, tabId, scn_num )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--Ϊ���ѡ�񷿼䣬�����븱��
--**********************************
function x808002_OnSelectRoom( sceneId, selfId, destsceneId, tabId  )

	--�Ҳ��������
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--�Ƿ����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--���ø����رձ�־, 0���ţ�1�ر�
--LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )

	--����غ���
	rnd			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )
	--��ұ�����ȡ���价��Ϊ���м�ֵ
	guid		= LuaFnObjId2Guid( sceneId, selfId )
	--���м�ֵ�����򣬼�ֵԽ������Խ��ǰ�������� * 3 ��ʤ�߼�2�����߼�1
	ply_id	= HitParadePlayerJoin( sceneId, tabId, guid, rnd*3 )
	if ply_id < 0 then
		return
	end
	--���븱��������
	ent_id	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["enn"], ( ent_id + 1 ) )

	--��Ӫ�Ż��棬��Ϊÿ�ν��볡��ʱ����Ӫ�����
	id_mod	= ent_id - floor( ent_id / 2 ) * 2
	if id_mod == 0 then
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampA )
	else
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampB )
	end

	--��������
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )

	--���������������С64*64
	idRoom	= floor( ent_id / 2 ) - floor( (scn_num-1) * 16 )
	px_mod	= idRoom - floor( idRoom /4 ) * 4
	if px_mod < 0 or px_mod >= 4 then
		px_mod= 0
	end
	px			= floor( px_mod * 64 + 32 )
	pz_mul	= floor( idRoom / 4 )
	if pz_mul < 0 or pz_mul >= 4 then
		pz_mul= 0
	end
	pz			= floor( pz_mul * 64 + 32 )

	--���븱��
	NewWorld( sceneId, selfId, destsceneId, px, pz )
	
	--�ͳ��
	LuaFnAuditQuest( sceneId, selfId, "������" )
	
	--�۳���Ǯ��ֻ�ڵ�һ�ֿ�Ǯ��
	if rnd <= 1 then

		-- ʹ�ô����ȼ��Ľ�Ǯ���ĺ���
		-- ԭ���۽��û���ж��Ƿ��Ǯʧ�ܣ����Կ۽���Ҳδ���Ƿ��Ǯʧ�ܵĴ���				
		LuaFnCostMoneyWithPriority (sceneId, selfId, x808002_g_GoldMin)
				
		--Add Log
		LogInfo	= format( "[TAOSHA]: LuaFnCostMoneyWithPriority( sceneId=%d, GUID=%0X, Money=%d )", sceneId, guid, x808002_g_GoldMin )
		MissionLog( sceneId, LogInfo )
	end
	
	--��¼����غ�������+����ڼ���+�غ�����YY+DDD+RR��
	rnd_MD	= GetDayTime() * 100 + rnd
	SetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND, rnd_MD )
	--��¼������
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, 0 )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnSelectRoom( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, ent_id=%d, idRoom=%d, px=%d, pz=%d",
		sceneId, destsceneId, guid, tabId, ent_id, idRoom, px, pz )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x808002_OnPlayerEnter( sceneId, selfId )
	
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlayerEnter( sceneId=%d, GUID=%0X )",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ) )
	MissionLog( sceneId, LogInfo )

	--���ø�����Ϣ
	--�س������ݱ����㸽��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )

	--�����رձ�־
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )

	--�����У�����᳡
	if LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"] ) == x808002_g_CopySceneType then
		--�ж�����Ƿ��Ѿ������ûغϱ���
		rnd_self= x808002_GetMyCurrentRound( sceneId, selfId )
		rnd			= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"] )
		if rnd_self ~= rnd then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			x808002_OnGoBack( sceneId, selfId )
			return
		end
		if LeaveFlag > 0 then
			x808002_MsgBox( sceneId, selfId, "�����᱾�λ�Ѿ�����" )
			x808002_OnGoBack( sceneId, selfId )
			return
		end

		--���ö�����Ӫ
		idCamp	= GetMissionData( sceneId, selfId, MD_PREV_CAMP )
		SetUnitCampID( sceneId, selfId, selfId, idCamp )
		--������ҵ�ָ��Pvp��Ȩλ
		SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2�Ǿ�����Ȩ���
		--�����޵�BUFF
		--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808002_g_GodBuff, 0 )
		--���غϻ�ʤ��ǣ�ʤ���ߴ���
		SetMissionFlag( sceneId, selfId, MF_DATAOSHA_WIN, 0 )

	end

end

--**********************************
--������ڸ����������¼�
--**********************************
function x808002_OnHumanDie( sceneId, selfId, killerId )

	--ʧ���ߴ���
	--��¼������
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, -10 )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_fal"] )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_flx"] )
	--������ҵ�ָ��Pvp��Ȩλ
	--SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2�Ǿ�����Ȩ���

	--��ʤ�ߴ���
	--��¼������
	if killerId == nil or LuaFnIsObjValid( sceneId, killerId ) ~= 1 then
		return
	end
	SetMissionData( sceneId, killerId, MD_DATAOSHA_RESULT, 10 )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_win"] )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_wnx"] )
	LuaFnSendSystemMail( sceneId, GetName( sceneId, killerId ), x808002_g_Msg["r_mal"] )
	--������ҵ�ָ��Pvp��Ȩλ
	--SetPvpAuthorizationFlagByID( sceneId, killerId, 2, 0 )		--2�Ǿ�����Ȩ���
	if LuaFnIsCharacterLiving( sceneId, killerId ) == 1 then
		--���غϻ�ʤ��ǣ�ʤ���ߴ���
		SetMissionFlag( sceneId, killerId, MF_DATAOSHA_WIN, 1 )
		--x808002_OnGoBack( sceneId, killerId )
	end

end

--**********************************
--ɱ����������
--**********************************
function x808002_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x808002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x808002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x808002_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	--ȡ���Ѿ�ִ�еĶ�ʱ����
	local	TickCount	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"] )
	TickCount				= TickCount + 1
	--�����µĶ�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], TickCount )

	--�����رձ�־
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )
	--��������ʱ
	local	JoinFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"] )

	--��ȡ�������������
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	local	mem_obj		= LuaFnGetCopyScene_HumanObjId( sceneId, 0 )
	--������ҵȼ���ȡ�����Ϣ
	local	ActID, ActMinLev, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, mem_obj )

	--��ȡһ���غ��еı���ʱ�䳤��
	local	JoinTime	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetJoinTime", sceneId, x808002_g_TickTime )
	--��ȡһ���غ��еı���ʱ�䳤��
	local	AttackTime= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetAttackTime", sceneId, x808002_g_TickTime )
	AttackTime			= JoinTime + AttackTime

	--ʱ��У��
	local	CheckTime	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"] )
	if JoinTime > CheckTime then
		JoinTime			= JoinTime - CheckTime
	else
		JoinTime			= 0
	end
	if AttackTime > CheckTime then
		AttackTime		= AttackTime - CheckTime
	else
		AttackTime		= 0
	end

	if LeaveFlag < 1 then
	--���������

		if JoinFlag == 0 then
		--�Ƿ�ʼ����ʱ
			if TickCount == JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], x808002_g_JoinTick )
			elseif TickCount > JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], -1 )
				--���俪ʼ
				for i = 0, mem_num - 1 do
					mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
					if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
						break
					end
					--������ҵ�ָ��Pvp��Ȩλ
					SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 1 )			--2�Ǿ�����Ȩ���
				end
			end
		elseif JoinFlag > 0 then
		--��������ʱ
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], JoinFlag-1 )
			for i = 0, mem_num - 1 do
				mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
				if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
					break
				end
				str		= format( "���佫�� %d ���ʼ", JoinFlag * x808002_g_TickTime )
				x808002_MsgBox( sceneId, mem_obj, str )
			end
		end

		--�����Ƿ�ʱ
		if TickCount == (AttackTime-12) then
			--���伴����������ǰһ����ȫ�򹫸�
			if ActMinLev ~= nil then
				str		= format( x808002_g_Msg["n_son"], ActMinLev, 1 )
				x808002_MyGlobalNews( sceneId, str )
			end
		elseif TickCount >= AttackTime then
			--�������
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 1 )
		end
		--ɨ��᳡
		x808002_OnScanScene( sceneId )

	elseif LeaveFlag == 1 then
	--�����ѽ���
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		x808002_OnScanRoom( sceneId, mem_num )
	elseif LeaveFlag < x808002_g_CloseTick then
	--����ʱ
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			str			= format( "�㽫�� %d ����뿪����", ( x808002_g_CloseTick - LeaveFlag ) * x808002_g_TickTime )
			x808002_MsgBox( sceneId, mem_obj, str )
		end
	elseif LeaveFlag == x808002_g_CloseTick then
	--�س�
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )	--���ø����رձ�־
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			--������ҵ�ָ��Pvp��Ȩλ
			--SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 0 )			--2�Ǿ�����Ȩ���
			if LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1 then
				x808002_OnGoBack( sceneId, mem_obj )
			end
		end
		
		--ȫ�򹫸�
		if ActMinLev ~= nil then
			str			= format( x808002_g_Msg["n_end"], ActMinLev )
			x808002_MyGlobalNews( sceneId, str )
		end
	end

end

--**********************************
--�������ɨ��᳡
--���򣺻������ʱ��Ե�ͼ���з���
--ɨ��һ�Σ���������>1������ʧ�ܣ���
--�������ݱ����ص��Աߵ�λ�á�
--**********************************
function x808002_OnScanRoom( sceneId, mem_num )

	--ɨ��᳡���
	local mem_lst		= {}
	local mem_px		= {}
	local mem_pz		= {}
	for i = 0, mem_num - 1 do
		mem_lst[i]						= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		mem_px[i], mem_pz[i]	= GetWorldPos( sceneId, mem_lst[i] )
	end

	--ɨ��32�����䣬����ʤ��
	local	rom_px, rom_pz		--ÿ����������Ͻ�����
	local	num, id
	for i = 0, 31 do
		px_mod	= i - floor( i /4 ) * 4
		pz_mul	= floor( i / 4 )
		rom_px	= floor( px_mod * 64 )
		rom_pz	= floor( pz_mul * 64 )
		
		num			= 0
		id			= -1
		for j = 0, mem_num - 1 do
			if num >= 2 then
				break
			end
			if mem_px[j] > rom_px and mem_px[j] < (rom_px+64) and
				mem_pz[j] > rom_pz and mem_pz[j] < (rom_pz+64) and
				LuaFnIsObjValid( sceneId, mem_lst[j] ) == 1 and
				LuaFnIsCharacterLiving( sceneId, mem_lst[j] ) == 1 then
				num	= num + 1
				id	= j
			end
		end

		--�ж����ʤ��
		if num == 1 then
			--�Ƿ��Ѿ��ڱ���ʧ�ܹ����Է��������
			if GetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT ) == -10 then
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_fal"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_flx"] )
			else
				--��¼������
				SetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT, 10 )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_win"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_wnx"] )
				LuaFnSendSystemMail( sceneId, GetName( sceneId, mem_lst[id] ), x808002_g_Msg["r_mal"] )
			end
		end
	end

end

--**********************************
--ɨ��᳡
--��ʤ�ߴ�������
--**********************************
function x808002_OnScanScene( sceneId )

	--��ȡ�������������
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	for i = 0, mem_num - 1 do
		mem_obj				= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
			break
		end
		--���غϻ�ʤ��ǣ�ʤ���ߴ���
		if GetMissionFlag( sceneId, mem_obj, MF_DATAOSHA_WIN ) == 1 and
			LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1
		then
			x808002_OnGoBack( sceneId, mem_obj )
		end
	end

end

--**********************************
--�س�
--**********************************
function x808002_OnGoBack( sceneId, selfId )

	NewWorld( sceneId, selfId, x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnGoBack( sceneId=%d, GUID=%0X ), BackScn=%d, BackX=%d, BackY=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		x808002_g_BackCity["scn"],
		x808002_g_BackCity["px"],
		x808002_g_BackCity["pz"] )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--��ȡĳ��Ҵ˴α���ĵ�ǰ�غ���
--**********************************
function x808002_GetMyCurrentRound( sceneId, selfId )

	rnd_MD		= GetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND )
	rnd_dat		= floor( rnd_MD / 100 )
	rnd_rnd		= mod( rnd_MD, 100 )
	if rnd_dat ~= GetDayTime() then
		return 0
	end
	return rnd_rnd

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808002_MsgBox( sceneId, selfId, Msg )

	if Msg == nil then
		return
	end
	--�Ƿ����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_MsgBox( sceneId=%d, GUID=%0X ), %s",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		Msg )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--ȫ�򹫸�
--**********************************
function x808002_MyGlobalNews( sceneId, Msg )

	if Msg == nil then
		return
	end

	AddGlobalCountNews( sceneId, Msg )
	--Add Log
	MissionLog( sceneId, "[TAOSHA]: "..Msg )

end
