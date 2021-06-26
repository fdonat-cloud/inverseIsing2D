plot(couplings,'mo:','LineWidth',2), xlabel('place in the array "couplings"'), ylabel('value'),title('A descent sort of the effective couplings greater than cutoff'), grid on;
savefig('plot.fig');
close
histogram(couplings,50), xlabel('value'), ylabel('number of occurrences in the array "couplings"'), grid on, title('Histogram of the effective couplings greater than cutoff');
savefig('hist.fig');
close
figure1 = openfig('plot.fig');
figure2 = openfig('hist.fig');
