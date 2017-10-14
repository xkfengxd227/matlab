function dis = odis_query_dataset(data, query)
dis=[];

n=size(data,2);
d=size(data,1);
if d ~= size(query,1)
    fprintf('dimension dismatch\n');
    return;
end

qs = repmat(query, 1, n);                                   % ����n�ݲ�ѯ����
diff=data-qs;                                                       % �����ѯ������ݵĲ�
square=diff'.*diff';                                                % ������ƽ��
dis=sum(square, 2);                                           % ƽ����
dis=(sqrt(dis))';                                                    % ����ת�õõ�ŷ�Ͼ���
 