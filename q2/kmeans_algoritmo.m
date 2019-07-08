function [codebook,ClusterNum] = kmeans_algoritmo(s,L,K)
codebook = cell(1,K);
indx = randsample(length(s),K);
for i=1:K
    codebook{i} = s{indx(i)};
end
vec_dist=cell(1,length(s));
ClusterNum = zeros(1,length(s));
Distortion = [0 0];
iter = 0;
while(iter <= 2 || (Distortion(1)-Distortion(2))/Distortion(2)>0.9)
    iter=iter+1;
    Distortion(1)=Distortion(2);
    Distortion(2)=0;
    for i=1:length(s)
        vec_dist{i}=dist(s{i},reshape(cell2mat(codebook),L,length(codebook) ));
        ClusterNum(i)=find(vec_dist{i}==min(vec_dist{i}),1);
        Distortion(2)=Distortion(2)+min(vec_dist{i});
    end
    Distortion(2)=Distortion(2)/length(s);
    for i=1:K
        temp=reshape(cell2mat(s),L,length(s));
        codebook{i}=mean(temp(:,ClusterNum==i),2)';
    end
end
