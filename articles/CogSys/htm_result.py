import matplotlib.pyplot as plt

# the histogram of the data
y = [90,86,78,75,72,66,57,53,50,48]
y = [100-x for x in y]
plt.bar(range(1,11),y,width=0.5,align='center', color='#afafaf')


plt.xlabel('Noise level', fontsize=20)
plt.ylabel('Error rate, %', fontsize=20)
#plt.title('Histogram of R-FSM precision')
plt.axis([0, 11, 0, 70])
plt.grid(True)
#plt.show()
plt.savefig('hist.png', dpi=800)