function metrixtofile(metrix, filename, dataformat)

total = size(metrix, 2);
dimension = size(metrix, 1);
fid = fopen(filename,'w');
fprintf(fid, '%d %d\n', total, dimension);
for i=1:total
    fprintf(fid, '%d', i);
    for j=1:dimension
		if strcmp(dataformat, 'single') || strcmp(dataformat, 'double')
			fprintf(fid, ' %f', metrix(j,i));
		elseif strcmp(dataformat, 'uint32')
			fprintf(fid, ' %d', metrix(j,i));
        end
    end
    fprintf(fid, '\n');
end
fclose(fid);