--����NPC
--�ξ�
--��ͨ

--**********************************
--�¼��������
--**********************************

function x008007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nRet = random(5)
		if	nRet <=1	then
			AddText(sceneId,"  ����ǰ�����Ź�һս�����ǰܸ������ľ������������Źء�����������Ѿ����˴��ССʮ���̣�����û���ܹ��⸴���Źء�")
		elseif	nRet <=2	then
			AddText(sceneId,"  ǰ���죬��˾����������Ӽ�������һ���ˣ���˵�����Ź�̫�ز��ӻݵĵܵܣ����������١������˾��ÿ�춼�ں����������ܾ��顣")
		elseif	nRet <=3	then
			AddText(sceneId,"  �����о���˵������֮ǰ������#G��Σɽ#W�쿴����ʱ��������һλ������������һ���Ů�ӡ��ţ���������#G[220��100]#W������")
		elseif	nRet <=4	then
			AddText(sceneId,"  �����о���˵������֮ǰ������#G����Ͽ#W�������ı����Ų���·�������һ�����ص�ɽ���ŵ��������ţ���������#G[149��42]#W������")
		else
			AddText(sceneId,"  ����#G����Ͽ#Wһֱ�ߣ����ܵ���#G���Ź�#W�ˣ��ţ�����#G[66��91]#W��������ҪС�ĵ㣬���ı��Ǻ��ײеģ�����ɱ�˶���գ�۰���")
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

