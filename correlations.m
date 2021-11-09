%% Find correlation coeeficients KENDALL between c-fos density and CR amp in each brain region
%in total_neurons_t each column is a brain area, rows are mice
neuron_density_region = neuron_density'; 
[rhok,pvalk] = corr(CR_amp,neuron_density_region,'Type','Kendall');
rhok = rhok';
pvalk = pvalk';
table_corr_k = table (region, rhok, pvalk);

%% Find correlation coeeficients SPEARMAN  between c-fos density and CR amp in each brain region
%in total_neurons_t each column is a brain area, rows are mice
neuron_density_region = neuron_density'; 
[rhos,pvals] = corr(CR_amp,neuron_density_region,'Type','Spearman');
rhos = rhos';
pvals = pvals';
table_corr_s = table (region, rhos, pvals);

%% Select only regions where the correlation is significant

neuron_density = table (neuron_density);
Table_corr_cortex = [table_corr_k neuron_density];

if any(Table_corr_cortex.pvalk<0.05)
    significant_corr_k = find(any(pvalk<0.05,2));
    cortex_significant_corr_k = Table_corr_cortex (significant_corr_k,:);
end

%save ('D:\cfos\1_cortex\learners\ccortex_significant_corr_k','cortex_significant_corr_k'); 

%% checking plots

figure
plot(cortex_significant_corr_k.neuron_density(1,:),CR_amp,'.','MarkerSize',15)
figure
plot(cortex_significant_corr_k.neuron_density(2,:),CR_amp,'.','MarkerSize',15)
figure
plot(cortex_significant_corr_k.neuron_density(3,:),CR_amp,'.','MarkerSize',15)

