 --ʦ������

--MisDescBegin
--�ű���
x229010_g_ScriptId = 229010

--�����
x229010_g_MissionId = 1060

--�������
x229010_g_MissionKind = 2

--����ȼ�
x229010_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x229010_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x229010_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x229010_g_MissionName="ʦ������"
x229010_g_MissionInfo=""  --��������
x229010_g_MissionTarget = "����... ... ��һֱΪ���ŵķ������ھ��ľ��������Ź��������ٶ������һ������ɣ�#G%s#W�ո��ҷɸ봫�飬˵������Ҫ��æ����ȥ��һ��#G%s#W��#Y%s#W�����������ᰲ���������ġ�#r#{SMRW_090206_01}"
x229010_g_ContinueInfo="�ɵò���"		--δ��������npc�Ի�
x229010_g_MissionComplete="�ҽ�����������Ѿ���������"					--�������npc˵���Ļ�
x229010_g_MissionRound=17

x229010_g_DoubleExp = 48
x229010_g_AccomplishCircumstance = 1

--��ʽ�ַ����е�����, ��ʾ��4��ʼ,�����λ��SetMissionByIndex(...)�Ķ��ٶ���
x229010_g_StrForePart=4

x229010_g_StrList = {
						"����#{_INFOAIM61,61,9,����}",
						"���ָ���",
						"����#{_INFOAIM35,86,13,����}",
						"������#{_INFOAIM96,73,15,������}",
						"��ӡ#{_INFOAIM41,144,10,��ӡ}",
						"����#{_INFOAIM89,56,11,����}",
						"�ս�#{_INFOAIM99,45,17,�ս�}",
						"������#{_INFOAIM58,73,12,������}",
						"�밢��#{_INFOAIM62,68,14,�밢��}",
						"����#{_INFOAIM128,78,16,����}", 
						"���׸���",
						"�һ��󸱱�",
						"�ƽѸ���",
						"����������",
						"��÷�帱��",
						"���Է帱",
						"�ȵ׸���",
						"���񶴸���", 
						"����",
						"����",
						"����",
						"ؤ��",
						"����",
						"��ɽ",
						"�䵱",
						"��ң",
						"����",
						}
						
--MisDescEnd

--add by xindefeng
--x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()����ʹ��x229010_g_StrList������Index��NPC����,�������Զ�Ѱ·��Ϣ��,�޷��ҵ���ȷIndex,��˽���
--�˱��x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()ʹ�����ҵ���ȷIndex��NPC����
x229010_g_StrList2 = {
						"����",
						"���ָ���",
						"����",
						"������",
						"��ӡ",
						"����",
						"�ս�",
						"������",
						"�밢��",
						"����",
						"���׸���",
						"�һ��󸱱�",
						"�ƽѸ���",
						"����������",
						"��÷�帱��",
						"���Է帱",
						"�ȵ׸���",
						"���񶴸���", 
						"����",
						"����",
						"����",
						"ؤ��",
						"����",
						"��ɽ",
						"�䵱",
						"��ң",
						"����",
						}
						
--/////////////////////////////////////////////////////////////////////////////////////////////////////
            
--����������ʹ��Ŷ���
x229010_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8}

--�����б�
x229010_g_FuBen_List = {
								{menpainame="����", menpai=MP_SHAOLIN  , NpcName="����", scene=9, posx=61, posz=61, FubenName="���ָ���"},
								{menpainame="����", menpai=MP_DALI     , NpcName="����", scene=13, posx=35, posz=86, FubenName="���׸���"},
								{menpainame="����", menpai=MP_EMEI     , NpcName="������", scene=15, posx=96, posz=73, FubenName="�һ��󸱱�"},
								{menpainame="ؤ��", menpai=MP_GAIBANG  , NpcName="��ӡ", scene=10, posx=41, posz=144, FubenName="�ƽѸ���"},
								{menpainame="����", menpai=MP_MINGJIAO , NpcName="����", scene=11, posx=89, posz=56, FubenName="����������"},
								{menpainame="��ɽ", menpai=MP_TIANSHAN , NpcName="�ս�", scene=17, posx=99, posz=45, FubenName="��÷�帱��"},
								{menpainame="�䵱", menpai=MP_WUDANG   , NpcName="������", scene=12, posx=58, posz=73, FubenName="���Է帱��"},
								{menpainame="��ң", menpai=MP_XIAOYAO  , NpcName="�밢��", scene=14, posx=62, posz=68, FubenName="�ȵ׸���"},
								{menpainame="����", menpai=MP_XINGSU   , NpcName="����", scene=16, posx=128, posz=78, FubenName="���񶴸���"},
							}
	
--changed by xindefeng                								
function x229010_GetStrIndexByStrValue(stringV)
	for i, v in x229010_g_StrList2 do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("���뽫%sע�ᵽStrList��", stringV)
	--PrintStr(strText)
	return 0;
end

--changed by xindefeng
--��x229000_IsFubenMission(),x229000_SetFubenMissionSucc()����
function x229010_GetStrValueByStrIndex(sceneId, index)
	if index+1 >= 1 and index+1 <= getn(x229010_g_StrList2) then
		return x229010_g_StrList2[index+1]	
	end
	return ""
end

function x229010_AddOtherMenpaiFubenMission(sceneId, selfId, missionId, targetId)
	local index	= 1
	local a = {}
		
	for i, v in x229010_g_FuBen_List do
		if v.menpai ~= GetMenPai(sceneId, selfId) then
			a[index] = i
			index = index + 1
		end	
	end
	
	index = a[random(getn(a))]
	
	local menpaiName = x229010_g_FuBen_List[index].menpainame
	local npcName =  x229010_g_FuBen_List[index].NpcName
	local fubenName =  x229010_g_FuBen_List[index].FubenName
	local nSceneId = x229010_g_FuBen_List[index].scene
	local posx = x229010_g_FuBen_List[index].posx
	local posz = x229010_g_FuBen_List[index].posz
	
	--���ӽ�������ı�Ҫ�ж�
	CallScriptFunction( 500501, "CheckAccept_Necessary", sceneId, selfId)
	
	--������������б�
	local bAdd = AddMission( sceneId,selfId, missionId, x229010_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local NpcNameIndex = x229010_GetStrIndexByStrValue(npcName)
	local MenpaiNameIndex = x229010_GetStrIndexByStrValue(menpaiName)
	
	--�õ�������20�������е����к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229010_g_SubMissionTypeEnum.otherMenpaiFuben)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+1, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+2, NpcNameIndex)
	
	Msg2Player(  sceneId, selfId,"#Y��������ʦ������", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("����... ... ��һֱΪ���ŵķ������ھ��ľ��������Ź��������ٶ������һ������ɣ�%s�ո��ҷɸ봫�飬˵������Ҫ��æ����ȥ��һ��%s��%s�����ᰲ���������ġ�",
			menpaiName, menpaiName, npcName)
			
	BeginEvent(sceneId)
		AddText(sceneId, strMissionTarget)
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
	
	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)

	round = round + 1

	if	round >= 21 then
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
	else
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x229010_OnEnumerate( sceneId, selfId, targetId )
	return
end

--**********************************
--����
--**********************************
function x229010_OnAbandon( sceneId, selfId )
	local shimenMissionIdList = {1080, 1090, 1065, 1070, 1060, 1100, 1075, 1085, 1095}
	for i, v in shimenMissionIdList do
		if IsHaveMission(sceneId,selfId,v) > 0	 then
			--ɾ����������б��ж�Ӧ������
	  	DelMission( sceneId, selfId, v )
	  	SetMissionData(sceneId,selfId,MD_SHIMEN_HUAN,0)	--������0
 			--����ͨ�÷����ӿ�
			------------------------------------------------------------------
		  CallScriptFunction( 500501, "Abandon_Necessary", sceneId, selfId )
			-------------------------------------------------------------------
			break
		end	
	end
end

