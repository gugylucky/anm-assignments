addpath(genpath('Functions'));

% a = linspace(1, 100, 101);
a = [33];
for j = 1:1
    c_sejati = 1/a(j);
    x = linspace(0, 2/a(j), 101);

    c = zeros(1, 101);
    n = zeros(1, 101);
    for i = 1: 101
        [c(i), n(i)] = FindReciprocal(a(j), x(i));
    end

    h = figure; set(h, 'Visible', 'off');
    hold on
    plot(x, n)
    plot([c_sejati c_sejati], get(gca,'ylim'))
    hold off
    title(['a = ', num2str(a(j)), ', c sejati = ', num2str(c_sejati)]);
    xlabel('tebakan awal');
    ylabel('jumlah lelaran');
    
    saveas(h, ['plots/', num2str(j)], 'png');
end