plot(inferredCouplings,'mo:','LineWidth',2), xlabel('place in the array "inferredCouplings"'), ylabel('value'),title('A descent sort of the effective couplings greater than cutoff'), grid on;
savefig('plot.fig');
close
histogram(inferredCouplings,50), xlabel('value'), ylabel('number of occurrences in the array "inferredCouplings"'), grid on, title('Histogram of the effective couplings greater than cutoff');
savefig('hist.fig');
close
figure1 = openfig('plot.fig');
figure2 = openfig('hist.fig');
