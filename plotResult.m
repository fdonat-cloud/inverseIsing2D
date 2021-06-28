f = figure('visible', 'off');
plot(couplings,'mo:','LineWidth',2), xlabel('place in the array "couplings"'), ylabel('value'),title('A descent sort of the effective couplings greater than cutoff'), grid on;
print -djpeg sorting.jpg
close(f)

g = figure('visible','off');
histogram(couplings,50), xlabel('value'), ylabel('number of occurrences in the array "couplings"'), grid on, title('Histogram of the effective couplings greater than cutoff');
print -djpeg histogram.jpg
close(g)

movefile('sorting.jpg','results');
movefile('histogram.jpg','results');