-- 210518 ��װ�һ�NPC


--�ű���
x210518_g_ScriptId = 210518

--��ӵ�е��¼�ID�б�
x210518_g_eventList={}

x210518_g_EquipList={	

-- ������װ1
{n=110,id=10500009},{n=111,id=10510009},{n=112,id=10511009},{n=113,id=10512009},{n=114,id=10513009},
{n=115,id=10514009},{n=116,id=10515009},{n=117,id=10520009},{n=118,id=10521009},{n=119,id=10522009}, 
{n=120,id=10523009},{n=121,id=10552009},{n=122,id=10553009},


-- ������װ2
{n=210,id=10500019},{n=211,id=10510019},{n=212,id=10511019},{n=213,id=10512019},{n=214,id=10513019},
{n=215,id=10514019},{n=216,id=10515019},{n=217,id=10520019},{n=218,id=10521019},{n=219,id=10522019}, 
{n=220,id=10523019},{n=221,id=10552019},{n=222,id=10553019},


-- ؤ����װ3
{n=310,id=10501009},{n=311,id=10510029},{n=312,id=10511029},{n=313,id=10512029},{n=314,id=10513029},
{n=315,id=10514029},{n=316,id=10515029},{n=317,id=10520029},{n=318,id=10521029},{n=319,id=10522029}, 
{n=320,id=10523029},{n=321,id=10552029},{n=322,id=10553029},


-- �䵱��װ4
{n=410,id=10502009},{n=411,id=10510039},{n=412,id=10511039},{n=413,id=10512039},{n=414,id=10513039},
{n=415,id=10514039},{n=416,id=10515039},{n=417,id=10520039},{n=418,id=10521039},{n=419,id=10522039}, 
{n=420,id=10523039},{n=421,id=10552039},{n=422,id=10553039},


-- ��ü��װ5
{n=510,id=10503009},{n=511,id=10510049},{n=512,id=10511049},{n=513,id=10512049},{n=514,id=10513049},
{n=515,id=10514049},{n=516,id=10515049},{n=517,id=10520049},{n=518,id=10521049},{n=519,id=10522049}, 
{n=520,id=10523049},{n=521,id=10552049},{n=522,id=10553049},


--������װ6
{n=610,id=10503019},{n=611,id=10510059},{n=612,id=10511059},{n=613,id=10512059},{n=614,id=10513059},
{n=615,id=10514059},{n=616,id=10515059},{n=617,id=10520059},{n=618,id=10521059},{n=619,id=10522059}, 
{n=620,id=10523059},{n=621,id=10552059},{n=622,id=10553059},


--��ɽ��װ7
{n=710,id=10504009},{n=711,id=10510069},{n=712,id=10511069},{n=713,id=10512069},{n=714,id=10513069},
{n=715,id=10514069},{n=716,id=10515069},{n=717,id=10520069},{n=718,id=10521069},{n=719,id=10522069}, 
{n=720,id=10523069},{n=721,id=10552069},{n=722,id=10553069},


--��ң��װ8
{n=810,id=10504019},{n=811,id=10510079},{n=812,id=10511079},{n=813,id=10512079},{n=814,id=10513079},
{n=815,id=10514079},{n=816,id=10515079},{n=817,id=10520079},{n=818,id=10521079},{n=819,id=10522079}, 
{n=820,id=10523079},{n=821,id=10552079},{n=822,id=10553079},


--������װ9
{n=910,id=10505009},{n=911,id=10510089},{n=912,id=10511089},{n=913,id=10512089},{n=914,id=10513089},
{n=915,id=10514089},{n=916,id=10515089},{n=917,id=10520089},{n=918,id=10521089},{n=919,id=10522089}, 
{n=920,id=10523089},{n=921,id=10552089},{n=922,id=10553089},

}

x210518_g_StoneList={
-- ��¥֮��
{n=1,id=20310011,num=1,str="#cFF0000���ֽ��պ���"},
-- ��¥֮��
{n=2,id=20310017,num=1,str="#cFF0000���̽��պ���"},
-- �����
{n=3,id=20310012,num=1,str="#cFF0000ؤ����պ���"},
-- �����
{n=4,id=20310019,num=1,str="#cFF0000�䵱���պ���"},
-- �ػ���
{n=5,id=20310014,num=1,str="#cFF0000���ҽ��պ���"},
-- ������Ƭ
{n=6,id=20310018,num=1,str="#cFF0000���޽��պ���"},
-- �˻�
{n=7,id=20310016,num=1,str="#cFF0000��ɽ���պ���"},
-- ��
{n=8,id=20310013,num=1,str="#cFF0000��ң���պ���"},
-- ��ӧ
{n=9,id=20310015,num=1,str="#cFF0000�������պ���"},
-- ����
{n=10,id=30505088,num=50,str="����"},
-- ����
{n=11,id=30505089,num=50,str="����"},
-- ħ��
{n=12,id=30505091,num=50,str="ħ��"},

}

--**********************************
--�¼��б�
--**********************************
function x210518_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #127#gFF3E96�����޸�������������װ���ԡ���ҿ��Ի�ȡ�����ɵ���װ�ˣ���������޵�����Ѫ���ˣ����һ����ӱ��������Թ��������Ծ�֪���ˣ�")
		AddText(sceneId,"  #G���պ���#W�����#G��#Y��������#W��#c00ffff����ͷĿ#W���伸��#cFF0000100%��")
		for i, eventId in x210518_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		--AddNumText( sceneId, x210518_g_ScriptId, "�������˵��", 6, 99 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A������װ", 1, 100 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A������װ", 1, 200 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6Aؤ����װ", 1, 300 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A�䵱��װ", 1, 400 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A��ü��װ", 1, 500 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A������װ", 1, 600 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A��ɽ��װ", 1, 700 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A��ң��װ", 1, 800 )
		AddNumText( sceneId, x210518_g_ScriptId, "#gFF6A6A������װ", 1, 900 )
		AddNumText( sceneId, x210518_g_ScriptId, "�뿪����", 13, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x210518_OnDefaultEvent( sceneId, selfId,targetId )
	x210518_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x210518_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	if nNumText == 99 then
		BeginEvent(sceneId)
			AddText(sceneId, "  �������˵�������Ǹ��󸱱���BOSS��������總�ӱ��乥������總�ӻ��乥����ħ�總�����乥�������總��ʧ�����ܣ��ɽ總�����������������Ч�����˽總��ʯ�����ܣ�ʯ���󲻿ɱ������������乥����������20%��ʧ����ʯ������2%���뿴�����ú�ѡ���������������ֻ�ں�����1Сʱ�ڿ��Ŷһ�")		
	end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	if nNumText == 100 or nNumText == 200 or nNumText == 300 or nNumText == 400 or nNumText == 500 or nNumText == 600 or nNumText == 700 or nNumText == 800 or nNumText == 900 then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�ҵľ��岿λ")
			if nNumText == 100 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�һ���", 1, nNumText+22)
			end
			if nNumText == 200 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�һ���", 1, nNumText+22)
			end
			if nNumText == 300 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�ؤ����װ--�һ���", 1, nNumText+22)
			end
			if nNumText == 400 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ��䵱��װ--�һ���", 1, nNumText+22)
			end
			if nNumText == 500 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ü��װ--�һ���", 1, nNumText+22)
			end				
			if nNumText == 600 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�һ���", 1, nNumText+22)
			end
			if nNumText == 700 then
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ɽ��װ--�һ���", 1, nNumText+22)
			end	
			if nNumText == 800 then      -- �˽� 
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ���ң��װ--�һ���", 1, nNumText+22)
			end	
			if nNumText == 900 then      -- ��� 
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+10)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--ñ��", 1, nNumText+11)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--Ь��", 1, nNumText+12)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+13)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�·�", 1, nNumText+14)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+15)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+16)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+17)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--����", 1, nNumText+18)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--���ָ", 1, nNumText+19)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�󻤷�", 1, nNumText+20)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�ҽ�ָ", 1, nNumText+21)
			AddNumText(sceneId, x210518_g_ScriptId, "#gFF6A6A#G�һ�������װ--�һ���", 1, nNumText+22)
			end	
																			
			AddNumText( sceneId, x210518_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 100 and nNumText < 1000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			
			local nLevel = 0
			if nNumText > 100 then    -- �һ���¥��
				nLevel = 1
			end
			if nNumText > 200 then    -- �ᾧ��������
				nLevel = 2
			end
			if nNumText > 300 then    -- �ᾧ��������
				nLevel = 3
			end
			if nNumText > 400 then    -- �ᾧ��������
				nLevel = 4
			end
			if nNumText > 500 then    -- �ᾧ��������
				nLevel = 5
			end
			if nNumText > 600 then    -- �ᾧ��������
				nLevel = 6
			end
			if nNumText > 700 then    -- �ᾧ��������
				nLevel = 7
			end
			if nNumText > 800 then    -- �ᾧ��������
				nLevel = 8
			end
			if nNumText > 900 then    -- �ᾧ��������
				nLevel = 9
			end
			
			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�" .. x210518_g_StoneList[nLevel].str
										.. "����".. tostring(x210518_g_StoneList[nLevel].num) .. "����  #r  #Gע�⿴װ���ʺ�ʲô���ɣ���Ҫ������Ŷ#W"
			AddText(sceneId, szStr)
			
			for i, item in x210518_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    		EndEvent(sceneId)
   	 	--DispatchMissionDemandInfo(sceneId,selfId,targetId, x210518_g_ScriptId, x210200_g_MissionId)
   		DispatchMissionContinueInfo(sceneId,selfId,targetId, x210518_g_ScriptId, 0)		
	end

	if nNumText == 8000 then
		BeginEvent(sceneId)
			local bStoneOk = 0
			if GetItemCount(sceneId, selfId, 10433313) >= 1  then
			bStoneOk = 1
			end
			if  bStoneOk == 1 then
				BeginEvent(sceneId)
					strText = "�����д˵��ߣ������ظ���ȡ��"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			else 
				TryRecieveItem( sceneId, selfId, 10433313, 1 )
				BeginEvent(sceneId)
					strText = "��ȡ������ɹ���"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)				
			end	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	end
			
	for i, findId in x210518_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x210518_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x210518_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x210518_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x210518_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x210518_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x210518_g_EquipList[nItemIndex].n > 100 then
		nLevel = 1
	end
	if x210518_g_EquipList[nItemIndex].n > 200 then
		nLevel = 2
	end
	if x210518_g_EquipList[nItemIndex].n > 300 then
		nLevel = 3
	end
	if x210518_g_EquipList[nItemIndex].n > 400 then
		nLevel = 4
	end
	if x210518_g_EquipList[nItemIndex].n > 500 then
		nLevel = 5
	end
	if x210518_g_EquipList[nItemIndex].n > 600 then
		nLevel = 6
	end
	if x210518_g_EquipList[nItemIndex].n > 700 then
		nLevel = 7
	end
	if x210518_g_EquipList[nItemIndex].n > 800 then
		nLevel = 8
	end
	if x210518_g_EquipList[nItemIndex].n > 900 then
		nLevel = 9
	end

		
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) >= x210518_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "��û���㹻����Ʒ�����ܻ�ȡװ����"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) < x210518_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "��û���㹻����Ʒ���Ա��۳���������Ʒ�Ƿ�������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- ��鱳���ռ�
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "��ı���û�пռ��ˡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x210518_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x210518_g_StoneList[nLevel].id, x210518_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "�۳�ʯͷʧ�ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x210518_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x210518_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d#cffffcc��#W#{_INFOMSG%s}#cffffcc���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x210518_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x210518_OnDie( sceneId, selfId, killerId )
end